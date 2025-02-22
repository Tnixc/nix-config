{
  description = "A config for aerospace and sketchybar that's reproducible and performant";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixpkgs-unstable";
    flake-utils.url = "github:numtide/flake-utils";
    sbarlua.url = "github:FelixKratz/SbarLua";
    sbarlua.flake = false;
    promise-lua.url = "github:pyericz/promise-lua";
    promise-lua.flake = false;
  };

  outputs = inputs @ {
    self,
    nixpkgs,
    flake-utils,
    ...
  }:
    flake-utils.lib.eachDefaultSystem (system: let
      pkgs = import nixpkgs {
        inherit system;
        config = {allowUnfree = true;};
        overlays = [];
      };

      # Build the interface to sketchybar for Lua
      sbar = pkgs.lua54Packages.buildLuaPackage {
        name = "sbar";
        pname = "sbar";
        version = "1";
        src = inputs.sbarlua;
        installPhase = ''
          mkdir -p $out/lib/lua/5.4
          cp bin/sketchybar.so $out/lib/lua/5.4/
        '';
        nativeBuildInputs = with pkgs;
          [
            gcc
            readline
            clang
            stdenv
          ]
          ++ lib.optionals stdenv.isDarwin (with pkgs.darwin.apple_sdk.frameworks; [CoreFoundation]);
      };

      # Build promise-lua
      promise-lua = pkgs.lua54Packages.buildLuarocksPackage {
        pname = "promise-lua";
        src = inputs.promise-lua;
        version = "0.4.1-1";
        knownRockspec =
          (pkgs.fetchurl {
            url = "https://luarocks.org/manifests/pyericz/promise-lua-0.4.1-1.rockspec";
            sha256 = "sha256-P/HP015RE/GUfarez/ezMuOflhXYPRTwbPdmz5J6qGE=";
          })
          .outPath;
      };

      # Build sbar-config-libs and perform text replacements using substituteInPlace.
      # Note: If you suspect that changes are not being picked up because of caching,
      #       try bumping the version or running with --rebuild.
      sbar-config-libs = pkgs.stdenv.mkDerivation {
        pname = "sbar-config-libs";
        version = "1.0.1"; # bump version to force rebuild when necessary

        src = ./.;

        buildInputs = [];

        installPhase = ''
          mkdir -p $out/share/lua/5.4/sbar-config-libs
          cp -r sbar-config-libs $out/share/lua/5.4/
          for luaFile in $(find $out/share/lua/5.4/ -type f -name "*.lua"); do
            substituteInPlace "$luaFile" --replace "AEROSPACEBIN" "${pkgs.aerospace}/bin/aerospace"
          done
        '';
      };

      # Build a Lua runtime with the desired packages.
      l = pkgs.lua5_4.withPackages (ps: with ps; [luafilesystem sbar sbar-config-libs promise-lua]);

      sketchybar-config = pkgs.writeScriptBin "sketchybarrc" ''
        #!${l}/bin/lua

        package.path = package.path .. ";${sbar-config-libs}/share/lua/5.4/?.lua;${sbar-config-libs}/share/lua/5.4/?/init.lua"

        base_dir = "${sbar-config-libs}/share/lua/5.4/sbar-config-libs"

        require("sbar-config-libs/init")
      '';

      aerospace-config = pkgs.writeTextFile {
        name = "aerospace-config";
        destination = "/share/aerospace.toml";
        text =
          builtins.replaceStrings
          ["NIXPATHTOSKETCHYCONFIG" "NIXPATHTOBINARIES" "SKETCHYBARBIN" "AEROSPACEBIN" "BORDERSBIN"]
          [
            "${sketchybar-config}/bin/sketchybarrc"
            "${l}/bin:${pkgs.sketchybar}/bin:${pkgs.jankyborders}/bin:${pkgs.aerospace}/bin"
            "${pkgs.sketchybar}/bin/sketchybar"
            "${pkgs.aerospace}/bin/aerospace"
            "${pkgs.jankyborders}/bin/borders"
          ]
          (pkgs.lib.readFile ./aerospace.toml);
      };

      aerospace-launcher = pkgs.writeShellApplication {
        name = "pwaerospace";
        text = ''
          echo "killing..."
          killall -q AeroSpace aerospace sketchybar borders || echo "No processes running"
          echo "launching..."
          ${pkgs.aerospace}/Applications/AeroSpace.app/Contents/MacOS/AeroSpace --config-path ${aerospace-config}/share/aerospace.toml
        '';
      };
    in rec {
      packages.pwaerospace = pkgs.symlinkJoin {
        name = "pwaerospace-full";
        paths = [
          pkgs.aerospace
          pkgs.sketchybar
          pkgs.sketchybar-app-font
          pkgs.jankyborders
          sbar-config-libs
          aerospace-launcher
          sketchybar-config
          aerospace-config
        ];
        nativeBuildInputs = [pkgs.makeBinaryWrapper];
        postBuild = ''
          wrapProgramBinary $out/Applications/AeroSpace.app/Contents/MacOS/AeroSpace \
            --add-flags "--config-path ${aerospace-config}/share/aerospace.toml"
        '';
      };

      packages.default = packages.pwaerospace;

      apps.pwaerospace = flake-utils.lib.mkApp {
        drv = packages.pwaerospace;
        name = "pwaerospace";
        exePath = "/bin/pwaerospace";
        mainProgram = "pwaerospace";
      };

      apps.default = apps.pwaerospace;

      devShell = pkgs.mkShell {
        buildInputs = [l packages.pwaerospace pkgs.aerospace pkgs.jankyborders pkgs.sketchybar];
      };
    });
}

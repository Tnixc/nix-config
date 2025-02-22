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
      # This is the interface to sketchybar for lua
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
          [gcc readline clang stdenv]
          ++ lib.optionals stdenv.isDarwin
          (with pkgs.darwin.apple_sdk.frameworks; [
            CoreFoundation
          ]);
      };

      # These sketchybar lua configs are littered with nested callbacks; I'd rather
      # be able to sequence things or to collect values from several shell calls
      # and then move forward using promises, but none seem to exist in stock lua
      # or in nixpkgs. :-(
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

      # TODO: Need to build dependent C programs here
      sbar-config-libs = pkgs.stdenv.mkDerivation {
        pname = "sbar-config-libs";
        version = "1.0.0";

        src = ./.;

        buildInputs = [];

        # Install Lua files to the correct directory
        installPhase = ''
          mkdir -p $out/share/lua/5.4/sbar-config-libs
          cp -r sbar-config-libs $out/share/lua/5.4/
        '';
      };

      # I thought using the lua withPackages stuff would add those things to the path and cpath, but I must be doing something wrong :(
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
        text = builtins.replaceStrings ["NIXPATHTOSKETCHYCONFIG" "NIXPATHTOBINARIES" "SKETCHYBARBIN" "AEROSPACEBIN" "BORDERSBIN"] ["${sketchybar-config}/bin/sketchybarrc" "${l}/bin:${pkgs.sketchybar}/bin:${pkgs.jankyborders}/bin:${pkgs.aerospace}/bin" "${pkgs.sketchybar}/bin/sketchybar" "${pkgs.aerospace}/bin/aerospace" "${pkgs.jankyborders}/bin/borders"] (pkgs.lib.readFile ./aerospace.toml);
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
        # buildInputs = [ ];
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
      };
      apps.default = apps.pwaerospace;
      devShell = pkgs.mkShell {
        buildInputs = [l packages.pwaerospace pkgs.aerospace pkgs.jankyborders pkgs.sketchybar];
      };
    });
}

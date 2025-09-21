{
  description = "A sketchybar config that's reproducible and performant";

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
        nativeBuildInputs = with pkgs; [
          gcc
          readline
          clang
          stdenv
        ];
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

      sketchybar-launcher = pkgs.writeShellApplication {
        name = "sketchybar-standalone";
        text = ''
          echo "Stopping any running sketchybar instance..."
          killall -q sketchybar || echo "No sketchybar processes running"
          echo "Starting sketchybar..."
          ${pkgs.sketchybar}/bin/sketchybar -c ${sketchybar-config}/bin/sketchybarrc
        '';
      };
    in rec {
      packages.sketchybar-standalone = pkgs.symlinkJoin {
        name = "sketchybar-standalone";
        paths = [
          pkgs.sketchybar
          pkgs.sketchybar-app-font
          sbar-config-libs
          sketchybar-launcher
          sketchybar-config
        ];
        nativeBuildInputs = [pkgs.makeBinaryWrapper];
      };

      packages.default = packages.sketchybar-standalone;

      apps.sketchybar-standalone = flake-utils.lib.mkApp {
        drv = packages.sketchybar-standalone;
        name = "sketchybar-standalone";
        exePath = "/bin/sketchybar-standalone";
      };

      apps.default = apps.sketchybar-standalone;

      devShell = pkgs.mkShell {
        buildInputs = [l packages.sketchybar-standalone pkgs.sketchybar];
      };
    });
}

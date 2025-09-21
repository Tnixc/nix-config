{
  description = "Standalone aerospace configuration";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixpkgs-unstable";
    flake-utils.url = "github:numtide/flake-utils";
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

      aerospace-config = pkgs.writeTextFile {
        name = "aerospace-config";
        destination = "/share/aerospace.toml";
        text = builtins.readFile ./aerospace.toml;
      };

      aerospace-launcher = pkgs.writeShellApplication {
        name = "aerospace-standalone";
        text = ''
          echo "Stopping any running AeroSpace instance..."
          killall -q AeroSpace aerospace || echo "No AeroSpace processes running"
          echo "Starting AeroSpace..."
          ${pkgs.aerospace}/Applications/AeroSpace.app/Contents/MacOS/AeroSpace --config-path ${aerospace-config}/share/aerospace.toml
        '';
      };
    in rec {
      packages.aerospace-standalone = pkgs.symlinkJoin {
        name = "aerospace-standalone";
        paths = [
          pkgs.aerospace
          pkgs.jankyborders
          aerospace-launcher
          aerospace-config
        ];
        nativeBuildInputs = [pkgs.makeBinaryWrapper];
        postBuild = ''
          wrapProgramBinary $out/Applications/AeroSpace.app/Contents/MacOS/AeroSpace \
            --add-flags "--config-path ${aerospace-config}/share/aerospace.toml"
        '';
        meta = {
          mainProgram = "aerospace-standalone";
        };
      };

      packages.default = packages.aerospace-standalone;

      apps.aerospace-standalone = flake-utils.lib.mkApp {
        drv = packages.aerospace-standalone;
        name = "aerospace-standalone";
        exePath = "/bin/aerospace-standalone";
      };

      apps.default = apps.aerospace-standalone;

      devShell = pkgs.mkShell {
        buildInputs = [packages.aerospace-standalone pkgs.aerospace pkgs.jankyborders];
      };
    });
}

{...}: let
  # Bun global packages that aren't available in nixpkgs.
  # Packages available in nixpkgs should go in modules/darwin/packages.nix instead.
  bunGlobals = {
    "@mariozechner/pi-coding-agent" = "0.64.0";
    "@sourcegraph/amp" = "0.0.1772734393-g2a936a";
    "@github/copilot" = "^0.0.365";
    "@github/copilot-language-server" = "^1.397.0";
    "agent-browser" = "^0.21.0";
    "glyphhanger" = "^5.0.0";
    "icon-gen" = "^5.0.0";
    "mac-appify" = "^2019.4.13";
    "ts-node" = "^10.9.2";
  };

  # install commands: bun install -g pkg@version
  installCmds = builtins.concatStringsSep "\n" (
    builtins.attrValues (
      builtins.mapAttrs (name: version: ''echo "  ${name}@${version}" && "$BUN" install -g "${name}@${version}" 2>&1'') bunGlobals
    )
  );

  # Write a manifest file so onChange triggers on any dependency change
  manifest = builtins.toJSON bunGlobals;
in {
  # This file exists purely to trigger onChange when dependencies change
  home.file.".bun/install/global/nix-manifest.json" = {
    text = manifest;
    onChange = ''
      BUN="$HOME/.bun/bin/bun"
      if [ -x "$BUN" ]; then
        echo "bun-globals: installing global packages..."
        ${installCmds}
        echo "bun-globals: done"
      else
        echo "bun-globals: bun not found at $BUN, skipping install"
      fi
    '';
  };
}

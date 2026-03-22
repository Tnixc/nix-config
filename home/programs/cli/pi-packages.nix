{...}: let
  # Pi extension packages — installed globally via `pi install`.
  # npm packages use npm's global root; git packages clone to ~/.pi/agent/git/.
  # All get registered in ~/.pi/agent/settings.json automatically.
  piPackages = [
    "npm:tau-mirror"
    "npm:pi-rewind"
    "npm:pi-tool-display"
    "npm:pi-web-access"
    "npm:pi-plan-mode"
    "npm:@tintinweb/pi-tasks"
    "npm:pi-usage-bars"
  ];

  installCmds = builtins.concatStringsSep "\n" (
    map (pkg: ''echo "  ${pkg}" && "$PI" install "${pkg}" 2>&1'') piPackages
  );

  manifest = builtins.toJSON piPackages;
in {
  home.file.".pi/agent/nix-manifest.json" = {
    text = manifest;
    onChange = ''
      # pi is #!/usr/bin/env node and shells out to npm — both need to be in PATH.
      # During nix activation the vite-plus node isn't in PATH yet.
      NODE_DIR="$HOME/.vite-plus/js_runtime/node/24.14.0/bin"
      export PATH="$NODE_DIR:$HOME/.bun/bin:$PATH"

      PI="$HOME/.bun/bin/pi"
      if [ -x "$PI" ] && [ -x "$NODE_DIR/node" ]; then
        echo "pi-packages: installing extensions..."
        ${installCmds}
        echo "pi-packages: done"
      else
        echo "pi-packages: pi or node not found, skipping install"
      fi
    '';
  };
}

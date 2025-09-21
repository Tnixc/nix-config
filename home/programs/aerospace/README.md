# Aerospace Configuration

## Goal

This is a standalone Aerospace configuration that's separate from sketchybar but designed to work well with it. The configuration is packaged with Nix for reproducibility and can be run independently of other window management tools.

## Features

- Clean aerospace configuration without tight coupling to other tools
- Nix-based packaging for reproducible builds
- Workspace management with 20 workspaces (1-10 on main monitor, 11-20 on secondary)
- Integrates with sketchybar through events but doesn't depend on it
- Includes JankyBorders for window decoration

## Using the Setup

### Development/Testing

To test the configuration locally:

```bash
nix run
```

This will stop any running AeroSpace instances and start fresh with the new config.

### Available Commands

- `just start` - Start aerospace in the background
- `just stop` - Stop all aerospace processes  
- `just restart` - Restart aerospace
- `just status` - Check if aerospace is running

## Key Bindings

### Window Management
- `cmd+alt+ctrl+h/j/k/l` - Focus window left/down/up/right
- `cmd+alt+ctrl+arrows` - Move window in direction
- `cmd+alt+ctrl+w/s/a/d` - Resize window

### Workspace Navigation
- `ctrl+1-9,0` - Switch to workspace 1-10 (main monitor)
- `ctrl+f1-f10` - Switch to workspace 11-20 (secondary monitor)
- `ctrl+shift+1-9,0` - Move window to workspace 1-10 and follow
- `ctrl+shift+f1-f10` - Move window to workspace 11-20 and follow

### Layout
- `cmd+alt+ctrl+f` - Toggle fullscreen
- `cmd+alt+ctrl+z` - Balance window sizes
- `cmd+ctrl+alt+/` - Cycle through tile layouts
- `ctrl+alt+cmd+;` - Enter service mode

### Service Mode (press `ctrl+alt+cmd+;` first)
- `h/j/k/l` - Join windows in direction
- `esc` - Reload config and exit service mode
- `r` - Reset layout and exit service mode
- `f` - Toggle floating/tiling and exit service mode
- `backspace` - Close all windows except current and exit service mode

## Integration with Sketchybar

This configuration sends events to sketchybar if it's running:
- `aerospace_started` - Sent when aerospace starts
- `aerospace_workspace_change` - Sent when switching workspaces

Sketchybar will automatically detect these events and update the workspace display accordingly.

## Home Manager Integration

To use this in your system configuration:

```nix
# In your home.nix or similar
home.packages = [
  (import ./path/to/aerospace/flake.nix).packages.${system}.default
];

# To start automatically
launchd = {
  agents = {
    "com.user.aerospace" = {
      enable = true;
      config = {
        Label = "com.user.aerospace";
        ProgramArguments = ["${pkgs.aerospace-standalone}/bin/aerospace-standalone"];
        RunAtLoad = true;
        KeepAlive = true;
      };
    };
  };
};
```

## Window Rules

Currently has one example rule that moves Discord to workspace 9. Add more rules in the `[[on-window-detected]]` sections at the bottom of `aerospace.toml`.

## Monitor Assignment

- Workspaces 1-10: Main monitor
- Workspaces 11-20: Secondary monitor (falls back to main if no secondary)

## Dependencies

- aerospace - The window manager
- borders (JankyBorders) - Window decorations
- sketchybar (optional) - Status bar integration

## Configuration

The main configuration is in `aerospace.toml`. Key settings:

- **Layout**: Default accordion layout with auto orientation
- **Gaps**: 8px inner and outer gaps
- **Normalization**: Enabled for better container management
- **Mouse**: Follows focus between monitors
- **Auto-unhide**: Prevents accidental cmd+h hiding

## Notes

- This configuration assumes you want to use aerospace as your primary window manager
- Sketchybar integration is optional - aerospace will work fine without it
- JankyBorders provides visual feedback for the focused window
- The configuration is designed to be minimal but functional
# Aerospace + Sketchybar Setup Guide

This guide explains how to use the separated aerospace and sketchybar configurations.

## Overview

The configurations have been separated to allow independent operation:

- **`aerospace/`** - Standalone aerospace window manager configuration
- **`sketchybar/`** - Standalone sketchybar status bar configuration with Lua

Both can run independently, but they're designed to work together seamlessly.

## Quick Start

### Option 1: Run Both Together

```bash
# Start aerospace
cd ~/nix-config/home/programs/aerospace
just start

# Start sketchybar  
cd ~/nix-config/home/programs/sketchybar
just start
```

### Option 2: Run Individually

```bash
# Just aerospace
cd ~/nix-config/home/programs/aerospace
nix run

# Just sketchybar
cd ~/nix-config/home/programs/sketchybar  
nix run
```

## Integration

When both are running:
- Aerospace sends workspace change events to sketchybar
- Sketchybar displays workspace information and app icons
- Window management and status bar operate independently

## Home Manager Configuration

Add both to your home configuration:

```nix
# In your home.nix
let
  aerospace-config = import ./home/programs/aerospace { inherit pkgs; };
  sketchybar-config = import ./home/programs/sketchybar { inherit pkgs; };
in {
  home.packages = [
    aerospace-config.packages.${system}.default
    sketchybar-config.packages.${system}.default
  ];

  launchd = {
    agents = {
      "com.user.aerospace" = {
        enable = true;
        config = {
          Label = "com.user.aerospace";
          ProgramArguments = ["${aerospace-config.packages.${system}.default}/bin/aerospace-standalone"];
          RunAtLoad = true;
          KeepAlive = true;
        };
      };
      "com.user.sketchybar" = {
        enable = true;
        config = {
          Label = "com.user.sketchybar";
          ProgramArguments = ["${sketchybar-config.packages.${system}.default}/bin/sketchybar-standalone"];
          RunAtLoad = true;
          KeepAlive = true;
        };
      };
    };
  };
}
```

## Development Workflow

### Making Changes

**Aerospace changes:**
```bash
cd ~/nix-config/home/programs/aerospace
# Edit aerospace.toml
just restart
```

**Sketchybar changes:**
```bash
cd ~/nix-config/home/programs/sketchybar
# Edit sbar-config-libs/*.lua files
just restart
```

### Available Commands

Both directories support:
- `just start` - Start in background
- `just stop` - Stop processes
- `just restart` - Restart with new config
- `just status` - Check if running
- `nix run` - Run in foreground (development)

## Troubleshooting

### Aerospace not responding to sketchybar
- Ensure aerospace is running: `cd aerospace && just status`
- Check aerospace logs for errors
- Verify sketchybar can find `aerospace` command in PATH

### Sketchybar not updating workspaces
- Ensure sketchybar is running: `cd sketchybar && just status`
- Check if aerospace events are being sent
- Look for error messages in sketchybar output

### Font issues
Install required fonts:
```bash
brew install --cask font-sf-pro font-sf-mono font-sf-mono-for-powerline
```

### Permission issues
Grant accessibility permissions to:
- AeroSpace.app
- Terminal/iTerm (for running scripts)

## Configuration Details

### Aerospace Features
- 20 workspaces (1-10 main, 11-20 secondary monitor)
- Accordion layout with auto orientation
- JankyBorders integration
- Comprehensive keybindings

### Sketchybar Features
- Lua-based configuration for performance
- Dynamic workspace display
- App icon integration
- System widgets (CPU, battery, wifi, etc.)
- Weather widget

## Benefits of Separation

1. **Independent Development** - Change one without affecting the other
2. **Modular Usage** - Use aerospace with different status bars
3. **Easier Debugging** - Isolate issues to specific components
4. **Better Maintenance** - Separate update cycles and dependencies
5. **Flexibility** - Mix and match with other tools

## Migration from Combined Setup

If migrating from the old combined setup:

1. Stop the old combined service
2. Remove old aerospace-sketchybar references
3. Add both new configurations to your system
4. Start both services independently

The configurations remain largely the same - just packaged separately.
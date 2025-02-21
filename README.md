<h1 align="center">
<img width="150px" src="https://github.com/user-attachments/assets/2bb2ceaf-5dbe-4c00-9a9c-7f95e754acc5" />
    <br>
        A simple nix-config for macOS
    <br>
    <img width="200" alt="image" src="https://github.com/user-attachments/assets/fad90f0c-8dce-4ee3-867b-b76f771215a8">
</h1>

<img width="1710" alt="image" src="https://github.com/user-attachments/assets/150eb08b-373d-436a-86a1-47f2118d5f2d" />

This is a [nix-darwin](https://github.com/LnL7/nix-darwin) config for a 13-inch M3 MacBook Air. It's based on [nix-darwin-kickstarter](https://github.com/ryan4yin/nix-darwin-kickstarter). It mainly uses [home-manager](https://github.com/nix-community/home-manager), and few programs are configured in nix. This is because it is often easier to find documentation for configuring software with their original schemas.

The color scheme is my theme [edo](https://github.com/tnixc/edo), the lush variant right now. Some fonts I use are `Basier Square Mono` and `Berkeley Mono`.

## Programs and Tools

- **Window Manager**: [aerospace](https://github.com/nikitabobko/AeroSpace)
- **Status Bar**: [sketchybar](https://github.com/FelixKratz/SketchyBar)
- **Terminal**: [kitty](https://github.com/kovidgoyal/kitty)
- **Shell**: fish, zsh
- **Text Editors**: Neovim, Zed

<details>
<summary><h3>Not using nix-darwin?</h3></summary>

If you're not using nix-darwin, you can still use parts of this configuration by manually copying the relevant files. Here's how:

1. **Sketchybar and Aerospace**: idk how to do this, i just followed some guy's flake.
2. **Yabai**: Copy `nix-config/home/programs/yabai/yabairc` to `~/.config/yabai/yabairc`
3. **Kitty**: Copy `nix-config/home/programs/kitty/kitty` to `~/.config/kitty/`
4. **Neovim**: Copy `nix-config/home/programs/nvim/nvim` to `~/.config/nvim/`
5. **Zed**: Copy the contents of `nix-config/home/programs/zed/zed` to `~/.config/zed/`

Remember to install the necessary dependencies for each program. You may need to run some build commands, and adjust some paths or settings to work without nix-darwin.
</details>

# Use
```
nix build .#darwinConfigurations.<Hostname>.system
```


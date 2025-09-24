<h1 align="center">
<img width="150px" src="https://github.com/user-attachments/assets/2bb2ceaf-5dbe-4c00-9a9c-7f95e754acc5" />
    <br>
        nix-config
    <br>
    <img width="200" alt="image" src="https://github.com/user-attachments/assets/fad90f0c-8dce-4ee3-867b-b76f771215a8">
</h1>

<img width="1710" height="1112" alt="image" src="https://github.com/user-attachments/assets/c01bef07-7240-4cb0-8fee-afc58ee82977" />

my whole nix-darwin config for my 13" m3 macbook air :3

started with [nix-darwin-kickstarter](https://github.com/ryan4yin/nix-darwin-kickstarter), then added [home-manager](https://github.com/nix-community/home-manager) for user stuff.

most programs just use their normal config files (symlinked via home-manager) instead of weird nix options bc i think that's actually better.

using my custom [edo](https://github.com/tnixc/edo) colorscheme everywhere (vit variant, based on vitess) with `Berkeley Mono` mainly.

## software

### desktop
- **window manager**: [AeroSpace](https://github.com/nikitabobko/AeroSpace)
- **status bar**: [SketchyBar](https://github.com/FelixKratz/SketchyBar)
- **window borders**: [JankyBorders](https://github.com/FelixKratz/JankyBorders)
- **keyboard stuff**: [Karabiner-Elements](https://karabiner-elements.pqrs.org/)

### terminal setup that's actually usable
- **terminal**: [Kitty](https://github.com/kovidgoyal/kitty) - no i'm not switching to ghostty
- **shells**: fish (main) and zsh (backup) with starship prompt

### dev environment for maximum productivity (copium)
- **editors**: [Neovim](https://github.com/neovim/neovim), [Zed](https://github.com/zed-industries/zed),VS Code
- **git stuff**: git with [Lazygit](https://github.com/jesseduffield/lazygit) tui and [Delta](https://github.com/dandavison/delta) for pretty diffs

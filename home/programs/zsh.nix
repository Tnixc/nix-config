{ pkgs, ... }:
{
  programs.zsh = {
    enable = true;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;
    initExtra = ''
      gc() {
        git commit -m "$1"
      }

      export BUN_INSTALL="$HOME/.bun"
      export PATH="$BUN_INSTALL/bin:$PATH"
      export PATH="/Users/tnixc/.cargo/bin:$PATH"

      eval "$(zoxide init zsh)"
    '';
  };

  home.shellAliases = {
    a = "nvim";
    q = "exit";

    cat = "bat --theme base16";
    bat = "bat --theme base16";
    g = "git";
    ga = "git add -A";
    lz = "lazygit";

    ls = "eza --icons";
    l = "eza --icons -la";
    la = "eza --icons -a";
    ll = "eza --icons -l";
    tree = "eza --icons --tree -a";

    cd = "z";

    rm = "trash";
    bs = "brew services";

    sw = "cd ~/nix-config ; gum spin --spinner line  --spinner.foreground 12 --title='switching to configuration...' --show-error make deploy && echo 'success' ; cd - >> /dev/null";
    sws = "cd ~/nix-config ; gum spin --spinner line  --spinner.foreground 12 --title='switching to configuration...' --show-error make deploy && echo 'success' ; cd - >> /dev/null ; bs restart sketchybar >> /dev/null ; killall yabai ; killall skhd";
  };
}

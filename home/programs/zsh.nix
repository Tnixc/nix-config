{ pkgs, ... }: {
  programs.zsh = {
    enable = true;
    enableCompletion = true;
    autosuggestion.enable = true;
    historySubstringSearch.enable = true;
    syntaxHighlighting.enable = true;
    initExtra = ''
      autoload -Uz compinit && compinit
      zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'

        gc() {
          git commit -m "$1"
        }

        export EDITOR=nvim
        export LLVM_PROFILE_FILE="/dev/null"

        export BUN_INSTALL="$HOME/.bun"
        export PATH="$BUN_INSTALL/bin:$PATH"
        export PATH="/Users/tnixc/.cargo/bin:$PATH"
        export PATH="/Users/tnixc/.bun/bin:$PATH"
        export PATH="/Users/tnixc/.local/bin:$PATH"
        export PATH="/opt/homebrew/opt/openjdk/bin:$PATH"

        export FZF_DEFAULT_OPTS="
        --color=fg:7,hl:4
        --color=fg+:15,hl+:6
        --color=info:2,prompt:1,pointer:5
        --color=marker:2,spinner:5,header:4"

        bindkey '^[h' backward-word
        bindkey '^[l' forward-word

        eval "$(zoxide init zsh)"
    '';
  };

  home.shellAliases = {
    a = "nvim";
    vim = "nvim";
    vi = "nvim";
    q = "exit";

    cat = "bat";
    ga = "git add -A";
    lz = "lazygit";

    g = "git";

    ls = "eza --icons --group-directories-first";
    l =
      "eza --icons -la --no-user --no-time --no-permissions --git --group-directories-first";
    lr =
      "eza --icons -laR --git-ignore --git --no-user --no-time --no-permissions --group-directories-first";
    tree = "eza --icons --tree --git-ignore";
    treea = "eza --icons --tree -a";

    cd = "z";
    f = "open .";

    rm = "trash";
    bs = "brew services";

    icat = "kitten icat --align left";

    sw =
      "cd ~/nix-config ; gum spin --spinner line  --spinner.foreground 12 --title='switching to configuration...' --show-error make deploy ; cd - >> /dev/null";
    swd = "cd ~/nix-config ; make deploy ; cd - >> /dev/null";
    sws =
      "cd ~/nix-config ; gum spin --spinner line  --spinner.foreground 12 --title='switching to configuration...' --show-error make deploy ; cd - >> /dev/null ; bs restart sketchybar >> /dev/null ; killall yabai ; killall skhd";
  };
}

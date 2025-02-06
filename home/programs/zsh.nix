{ pkgs, ... }:
{
  programs.zsh = {
    enable = true;
    enableCompletion = true;
    autosuggestion.enable = true;
    historySubstringSearch.enable = true;
    syntaxHighlighting.enable = true;
    initExtra = ''
      # autoload -Uz compinit && compinit
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
        export PATH="/opt/homebrew/bin:$PATH"

        export FZF_DEFAULT_OPTS=" \
        --color=bg+:#2A2A37,spinner:#E6A5C9,hl:#E46876 \
        --color=fg:#C5C9C5,header:#E46876,info:#A292A3,pointer:#E6A5C9 \
        --color=marker:#938AA9,fg+:#C5C9C5,prompt:#A292A3,hl+:#E46876 \
        --color=selected-bg:#3a3a4c \
        --multi"

        bindkey '^[h' backward-word
        bindkey '^[l' forward-word

        source <(fzf --zsh)

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
    gz = "nvim +DiffviewOpen";

    g = "git";

    ls = "eza --icons --group-directories-first";
    l = "eza --icons -la --no-user --no-time --no-permissions --git --group-directories-first";
    lr = "eza --icons -laR --git-ignore --git --no-user --no-time --no-permissions --group-directories-first";
    tree = "eza --icons --tree --git-ignore";
    treea = "eza --icons --tree -a";

    cd = "z";
    f = "open .";

    rm = "trash";
    bs = "brew services";

    icat = "kitten icat --align left";

    swd = "cd ~/nix-config ; make ; cd - >> /dev/null";
  };
}

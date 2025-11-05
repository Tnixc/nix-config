{pkgs, ...}: let
  theme = import ../theme.nix;
  c = theme.colors;
in {
  programs.zsh = {
    enable = true;
    enableCompletion = true;
    autosuggestion.enable = true;
    historySubstringSearch.enable = true;
    syntaxHighlighting.enable = true;
    initContent = ''
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
        export PATH="/usr/local/texlive/2025/bin/universal-darwin:$PATH"
        export TERM=xterm-256color

        export FZF_DEFAULT_OPTS=" \
        --color=bg+:${c.surface0},spinner:${c.rosewater},hl:${c.red} \
        --color=fg:${c.text},header:${c.red},info:${c.mauve},pointer:${c.rosewater} \
        --color=marker:${c.lavender},fg+:${c.text},prompt:${c.mauve},hl+:${c.red} \
        --color=selected-bg:${c.surface1} \
        --multi"

        bindkey '^[h' backward-word
        bindkey '^[l' forward-word

        source <(fzf --zsh)

        eval "$(zoxide init zsh)"

        # BEGIN opam configuration
        # This is useful if you're using opam as it adds:
        #   - the correct directories to the PATH
        #   - auto-completion for the opam binary
        # This section can be safely removed at any time if needed.
        [[ ! -r '/Users/tnixc/.opam/opam-init/init.zsh' ]] || source '/Users/tnixc/.opam/opam-init/init.zsh' > /dev/null 2> /dev/null
        # END opam configuration
    '';
  };

  home.shellAliases = {
    a = "nvim";
    q = "exit";

    cat = "bat";
    ga = "git add -A";
    lz = "lazygit";
    gz = "nvim +DiffviewOpen";
    g = "git";
    j = "just";

    nvs = "rm \"/Users/tnixc/.local/share/nvim/sessions/$(pwd | sed 's|/|%2F|g').vim\"";

    ls = "eza --icons --group-directories-first";
    l = "eza --icons -la --no-user --no-time --no-permissions --git --group-directories-first";
    lr = "eza --icons -laR --git-ignore --git --no-user --no-time --no-permissions --group-directories-first";
    tree = "eza --icons --tree --git-ignore";
    treea = "eza --icons --tree -a";

    # cd = "z";
    f = "open .";

    rm = "trash";
    bs = "brew services";

    icat = "kitten icat --align left";

    swd = "cd ~/nix-config ; make ; cd - >> /dev/null";
  };
}

{...}: {
  programs.zsh = {
    enable = true;
    enableCompletion = true;
    autosuggestion.enable = true;
    historySubstringSearch.enable = true;
    syntaxHighlighting.enable = true;

    initContent = ''
      # Completion matching (case insensitive)
      zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'

      # Git commit function
      gc() {
        git commit -m "$1"
      }

      # Key bindings
      bindkey '^[h' backward-word
      bindkey '^[l' forward-word

      # Initialize fzf and zoxide
      source <(fzf --zsh)
      eval "$(zoxide init zsh)"

      # BEGIN opam configuration
      [[ ! -r '/Users/tnixc/.opam/opam-init/init.zsh' ]] || source '/Users/tnixc/.opam/opam-init/init.zsh' > /dev/null 2> /dev/null
      # END opam configuration
    '';
  };
}

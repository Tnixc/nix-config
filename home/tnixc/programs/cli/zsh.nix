{...}: {
  programs.zsh = {
    enable = true;
    enableCompletion = true;
    autosuggestion.enable = true;
    historySubstringSearch.enable = true;
    syntaxHighlighting.enable = true;

    initContent = ''
      eval $(opam env)

      # Completion matching (case insensitive)
      zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'

      # Key bindings
      bindkey '^[h' backward-word
      bindkey '^[l' forward-word
    '';
  };
}

{...}: {
  programs.zsh = {
    enable = true;
    enableCompletion = true;
  };

  home.shellAliases = {
    a = "nvim";
  };
}

{...}: {
  ids.gids.nixbld = 30000;

  system = {
    primaryUser = "tnixc";
    stateVersion = 6;
  };

  # Create /etc/zshrc that loads the nix-darwin environment.
  programs.zsh.enable = true;
}

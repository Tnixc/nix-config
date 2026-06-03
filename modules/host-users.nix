{
  username,
  pkgs,
  ...
}:
#############################################################
#
#  Host & Users configuration
#
#############################################################
{
  # Adds fish to /etc/shells so it can be used as a login shell.
  programs.fish.enable = true;

  users.users."${username}" = {
    home = "/Users/${username}";
    description = username;
    shell = pkgs.fish;
  };

  nix.settings.trusted-users = [username];
}

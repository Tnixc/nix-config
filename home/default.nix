{ username, ... }:

{
  # import sub modules
  imports = [
    ./programs/zsh.nix
    ./programs/starship.nix
    ./programs/git.nix
    ./programs/sketchybar/sketchybar.nix
    ./programs/yabai/yabai.nix
    ./programs/skhd/skhd.nix
    ./programs/nvim/nvim.nix
    ./programs/zed/zed.nix
    ./programs/kitty/kitty.nix
    ./programs/karabiner/karabiner.nix
  ];

  # Home Manager needs a bit of information about you and the
  # paths it should manage.
  home = {
    username = username;
    homeDirectory = "/Users/${username}";

    # This value determines the Home Manager release that your
    # configuration is compatible with. This helps avoid breakage
    # when a new Home Manager release introduces backwards
    # incompatible changes.
    #
    # You can update Home Manager without changing this value. See
    # the Home Manager release notes for a list of state version
    # changes in each release.
    stateVersion = "24.05";
  };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}

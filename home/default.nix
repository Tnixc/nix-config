{
  username,
  lib,
  pwaerospace,
  config,
  ...
}: let
  config-dir = "${config.home.homeDirectory}/nix-config/home/config";
  mkLink = config.lib.file.mkOutOfStoreSymlink;
in {
  # import sub modules
  imports = [
    ./programs/zsh.nix
    ./programs/fish.nix
    ./programs/starship.nix
    ./programs/git.nix
    ./programs/lazygit.nix
    ./programs/direnv.nix
    ./programs/helix.nix
  ];

  home.file = {
    ".config/bat" = { source = mkLink "${config-dir}/bat"; };
    ".config/nvim" = { source = mkLink "${config-dir}/nvim"; };
    ".config/zed" = { source = mkLink "${config-dir}/zed"; };
    ".config/yabai" = { source = mkLink "${config-dir}/yabai"; };
    ".config/skhd" = { source = mkLink "${config-dir}/skhd"; };
    ".config/kitty" = { source = mkLink "${config-dir}/kitty"; };
    ".config/btop" = { source = mkLink "${config-dir}/btop"; };
  };

  launchd.agents."aerospace-sketchybar" = {
    enable = true;
    config = {
      ProgramArguments = [
        "${lib.getExe' pwaerospace.packages.aarch64-darwin.pwaerospace "pwaerospace"}"
        # "${aerospace-flake.packages.aarch64-darwin.pwaerospace}/bin/pwaerospace"
      ];
      RunAtLoad = true;
      KeepAlive = false;
      StandardOutPath = "/tmp/aerospace-sketchybar.log";
      StandardErrorPath = "/tmp/aerospace-sketchybar.error.log";
    };
  };

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
    # stateVersion = "24.11";
    stateVersion = "25.05";
  };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}

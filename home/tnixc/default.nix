{
  username,
  lib,
  pwaerospace,
  sketchybar-config,
  config,
  ...
}: let
  config-dir = "${config.home.homeDirectory}/nix-config/home/tnixc/config";
  mkLink = config.lib.file.mkOutOfStoreSymlink;
in {
  imports = [
    ./programs
    ./shell.nix
  ];

  home.file = {
    ".config/nvim" = {source = mkLink "${config-dir}/nvim";};
  };

  launchd.agents."aerospace" = {
    enable = false;
    config = {
      ProgramArguments = [
        "${lib.getExe pwaerospace.packages.aarch64-darwin.aerospace-standalone}"
      ];
      RunAtLoad = false;
      KeepAlive = false;
      StandardOutPath = "/tmp/aerospace.log";
      StandardErrorPath = "/tmp/aerospace.error.log";
    };
  };

  launchd.agents."sketchybar" = {
    enable = false;
    config = {
      ProgramArguments = [
        "${lib.getExe sketchybar-config.packages.aarch64-darwin.sketchybar-standalone}"
      ];
      RunAtLoad = false;
      KeepAlive = false;
      StandardOutPath = "/tmp/sketchybar.log";
      StandardErrorPath = "/tmp/sketchybar.error.log";
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
    stateVersion = "25.05";
  };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}

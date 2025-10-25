{
  username,
  lib,
  pwaerospace,
  sketchybar-config,
  config,
  ...
}: let
  config-dir = "${config.home.homeDirectory}/nix-config/home/config";
  mkLink = config.lib.file.mkOutOfStoreSymlink;
  # links a config directory
  linkConfigs = configDirs:
    builtins.foldl'
    (acc: dir: acc // {".config/${dir}" = {source = mkLink "${config-dir}/${dir}";};})
    {}
    configDirs;
in {
  home.file = linkConfigs [
    "bat"
    "nvim"
    "zed"
    "yabai"
    "skhd"
    "kitty"
    "btop"
    "karabiner"
    "zathura"
  ];

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

  launchd.agents."aerospace" = {
    enable = false;
    config = {
      ProgramArguments = [
        "${lib.getExe pwaerospace.packages.aarch64-darwin.aerospace-standalone}"
        # "${aerospace-flake.packages.aarch64-darwin.pwaerospace}/bin/pwaerospace"
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
    # stateVersion = "24.11";
    stateVersion = "25.05";
  };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}

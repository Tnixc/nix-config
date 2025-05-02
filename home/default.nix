{
  username,
  lib,
  pwaerospace,
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

  home.file = linkConfigs [
    "bat"
    "nvim"
    "zed"
    "yabai"
    "skhd"
    "kitty"
    "btop"
  ];

  launchd.agents."aerospace-sketchybar" = {
    enable = true;
    config = {
      ProgramArguments = [
        "${lib.getExe' pwaerospace.packages.aarch64-darwin.pwaerospace "pwaerospace"}"
        # "${aerospace-flake.packages.aarch64-darwin.pwaerospace}/bin/pwaerospace"
      ];
      RunAtLoad = true;
      KeepAlive = true;
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

{config, ...}: let
  config-dir = "${config.home.homeDirectory}/nix-config/home/config";
  mkLink = config.lib.file.mkOutOfStoreSymlink;
in {
  # Karabiner needs write access for automatic backups, so we keep it as a symlink
  home.file.".config/karabiner".source = mkLink "${config-dir}/karabiner";
}

{config, ...}: let
  config-dir = "${config.home.homeDirectory}/nix-config/home/config";
  mkLink = config.lib.file.mkOutOfStoreSymlink;
in {
  # Zed needs write access for runtime settings and uses JSONC for keymaps,
  # so we keep it as a symlink
  home.file.".config/zed".source = mkLink "${config-dir}/zed";
}

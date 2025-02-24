{...}: {
  home.file.".config/zed/themes" = {
    source = ./zed/themes;
    recursive = true;
  };
  home.file.".config/zed/keymap.json" = {
    source = ./zed/keymap.json;
  };
  # home.file.".config/zed/settings.json" = {
  #   source = ./zed/settings.json;
  # };
}

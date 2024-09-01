{ ... }: {
  home.file.".config/zed/themes" = {
    source = ./src/themes;
    recursive = true;
  };
  home.file.".config/zed/keymap.json" = { source = ./src/keymap.json; };
  home.file.".config/zed/settings.json" = { source = ./src/settings.json; };
}

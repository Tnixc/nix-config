{ ... }: {
  home.file.".config/sketchybar" = {
    source = ./src;
    recursive = true;
  };
}

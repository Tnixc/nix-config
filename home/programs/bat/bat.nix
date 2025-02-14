{...}: {
  home.file.".config/bat/themes/edo.tmTheme" = {
    source = ./edo.tmTheme;
  };
  programs.bat = {
    enable = true;
    config.theme = "edo";
  };
}

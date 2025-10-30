{pkgs, ...}: {
  programs.bat = {
    enable = true;
    config = {
      theme = "edo";
    };
    themes = {
      edo = {
        src = ./bat-themes;
        file = "edo.tmTheme";
      };
    };
  };
}

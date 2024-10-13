{ ... }: {
  # `programs.git` will generate the config file: ~/.config/git/config
  # to make git use this config file, `~/.gitconfig` should not exist!
  #

  #    https://git-scm.com/docs/git-config#Documentation/git-config.txt---global
  programs.git = {
    enable = true;
    lfs.enable = true;

    userName = "Tnixc";
    userEmail = "tnixxc@gmail.com";

    extraConfig = {
      core.pager = "delta --dark";
      core.autocrlf = "input";
      diff.algorithm = "histogram";
      merge.conflictstyle = "diff3";

      delta = {
        line-numbers = true;
        syntax-theme = "edo";
        blame-palette = [ "#24273A" "#1E2030" "#181926" "#363A4F" "#494D64" ];
        dark = true;
        file-decoration-style = "#BECAF9";
        file-style = "#BECAF9";
        hunk-header-decoration-style = "#23273D";
        hunk-header-file-style = "#23273D";
        hunk-header-line-number-style = "#23273D";
        hunk-header-style = "#23273D";
        line-numbers-left-style = "#6E738D";
        line-numbers-minus-style = "bold #FF6A7B";
        line-numbers-plus-style = "bold #90D05A";
        line-numbers-right-style = "#6E738D";
        line-numbers-zero-style = "#6E738D";
        minus-emph-style = "bold syntax #53394c";
        minus-style = "syntax #34293a";
        plus-emph-style = "bold syntax #404f4a";
        plus-style = "syntax #2c3239";
        map-styles = [
          "bold purple => syntax #494060"
          "bold blue => syntax #384361"
          "bold cyan => syntax #384d5d"
          "bold yellow => syntax #544f4e"
        ];
      };

      diff.colorMoved = "default";
      init.defaultBranch = "main";
      push.autoSetupRemote = true;
    };
  };
}

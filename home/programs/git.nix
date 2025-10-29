{...}: {
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
      commit.gpgsign = true;
      core.pager = "delta --dark";
      core.autocrlf = "input";
      diff.algorithm = "histogram";
      merge.conflictstyle = "diff3";

      delta = {
        line-numbers = true;
        syntax-theme = "edo";
        blame-palette = [
          "#121212"
          "#0A0A0A"
          "#000000"
          "#1E1E1E"
          "#232323"
        ];
        dark = true;
        file-decoration-style = "#D8D6C9";
        file-style = "#D8D6C9";
        hunk-header-decoration-style = "#23273D";
        hunk-header-file-style = "#23273D";
        hunk-header-line-number-style = "#23273D";
        hunk-header-style = "#23273D";
        line-numbers-left-style = "#4C4C4C";
        line-numbers-minus-style = "bold #CB7676";
        line-numbers-plus-style = "bold #80A665";
        line-numbers-right-style = "#4C4C4C";
        line-numbers-zero-style = "#4C4C4C";
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

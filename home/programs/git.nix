{...}: let
  theme = import ../theme.nix;
  c = theme.colors;
in {
  # `programs.git` will generate the config file: ~/.config/git/config
  # to make git use this config file, `~/.gitconfig` should not exist!
  #

  #    https://git-scm.com/docs/git-config#Documentation/git-config.txt---global
  programs.git = {
    enable = true;
    lfs.enable = true;

    settings = {
      user.name = "Tnixc";
      user.email = "tnixxc@gmail.com";

      commit.gpgsign = true;
      core.pager = "delta --dark";
      core.autocrlf = "input";
      diff.algorithm = "histogram";
      merge.conflictstyle = "diff3";

      delta = {
        line-numbers = true;
        syntax-theme = "edo";
        blame-palette = [
          c.base
          c.mantle
          c.crust
          c.surface0
          c.surface1
        ];
        dark = true;
        file-decoration-style = c.text;
        file-style = c.text;
        hunk-header-decoration-style = "#23273D";
        hunk-header-file-style = "#23273D";
        hunk-header-line-number-style = "#23273D";
        hunk-header-style = "#23273D";
        line-numbers-left-style = c.overlay0;
        line-numbers-minus-style = "bold ${c.red}";
        line-numbers-plus-style = "bold ${c.green}";
        line-numbers-right-style = c.overlay0;
        line-numbers-zero-style = c.overlay0;
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

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

      diff.colorMoved = "default";
      init.defaultBranch = "main";
      push.autoSetupRemote = true;
    };
  };
}

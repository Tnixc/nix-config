{ ... }: {
  programs.lazygit = {
    enable = true;
    settings = {
      git.paging.colorArg = "always";
      git.paging.pager = "delta --dark --paging=never";
      gui = {
        border = "single";
        nerdFontsVersion = "3";
        theme = {
          activeBorderColor = [ "blue" "bold" ];
          inactiveBorderColor = [ "#6c7086" ];
          optionsTextColor = [ "yellow" ];
          selectedLineBgColor = [ "#494D64" ];
          cherryPickedCommitBgColor = [ "#494D64" ];
          cherryPickedCommitFgColor = [ "#FF9ED0" ];
          unstagedChangesColor = [ "#FF6A7B" ];
          defaultFgColor = [ "#BECAF9" ];
          searchingActiveBorderColor = [ "#FAA296" ];
        };
        authorColors = { "Tnixc" = "#41DDCA"; };
      };
    };
  };
}


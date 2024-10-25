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
        unspecifiedAuthorColors = [
          "#FF6A7B"
          "#FF7DAA"
          "#FF9ED0"
          "#FFBAE2"
          "#FAA296"
          "#FF9856"
          "#E9AD5B"
          "#90D05A"
          "#62E4FF"
          "#05D1EC"
          "#6EA3FE"
          "#8995FF"
          "#C198FD"
        ];
      };
    };
  };
}

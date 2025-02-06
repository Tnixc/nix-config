{ ... }:
{
  programs.lazygit = {
    enable = true;
    settings = {
      git.paging.colorArg = "always";
      git.paging.pager = "delta --dark --paging=never";
      gui = {
        border = "single";
        nerdFontsVersion = "3";
        theme = {
          activeBorderColor = [
            "blue"
            "bold"
          ];
          inactiveBorderColor = [ "#6c7086" ];
          optionsTextColor = [ "yellow" ];
          selectedLineBgColor = [ "#3a3a4c" ];
          cherryPickedCommitBgColor = [ "#3a3a4c" ];
          cherryPickedCommitFgColor = [ "#D98AAD" ];
          unstagedChangesColor = [ "#E46876" ];
          defaultFgColor = [ "#C5C9C5" ];
          searchingActiveBorderColor = [ "#E6A5C9" ];
        };
        authorColors = {
          "Tnixc" = "#7AA89F";
        };
        unspecifiedAuthorColors = [
          "#E46876"
          "#C4746E"
          "#D98AAD"
          "#EAAB9D"
          "#E6A5C9"
          "#E6A96D"
          "#E6C384"
          "#87A987"
          "#7FB4CA"
          "#8BA4B0"
          "#7F94B4"
          "#938AA9"
          "#A292A3"
        ];
      };
    };
  };
}

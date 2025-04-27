{...}: {
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
          inactiveBorderColor = ["#6c7086"];
          optionsTextColor = ["yellow"];
          selectedLineBgColor = ["#232323"];
          cherryPickedCommitBgColor = ["#232323"];
          cherryPickedCommitFgColor = ["#D98AAD"];
          unstagedChangesColor = ["#CB7676"];
          defaultFgColor = ["#D8D6C9"];
          searchingActiveBorderColor = ["#C97D6E"];
        };
        authorColors = {
          "Tnixc" = "#5EA994";
        };
        unspecifiedAuthorColors = [
          "#CB7676"
          "#CC8D82"
          "#D98AAD"
          "#C98A7D"
          "#C97D6E"
          "#CC8D70"
          "#B8A865"
          "#80A665"
          "#5D9AA9"
          "#6394BF"
          "#687eaa"
          "#4C8E72"
          "#6872AB"
        ];
      };
    };
  };
}

{...}: {
  programs.lazygit = {
    enable = true;
    settings = {
      git.pagers = [
        {
          colorArg = "always";
          pager = "delta --dark --paging=never";
        }
      ];
      git.overrideGpg = true;
      gui = {
        border = "single";
        nerdFontsVersion = "3";
        theme = {
          activeBorderColor = [
            "cyan"
            "bold"
          ];
          inactiveBorderColor = ["#6c7086"];
          optionsTextColor = ["yellow"];
          selectedLineBgColor = ["#232323"];
          cherryPickedCommitBgColor = ["#232323"];
          cherryPickedCommitFgColor = ["#BC76C1"];
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
          "#BC76C1"
          "#C98A7D"
          "#C97D6E"
          "#CC8D70"
          "#CC9B70"
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

{
  theme,
  configRepoName,
  ...
}: {
  home.file."${configRepoName}/extra/agents/themes/custom.json".text = builtins.toJSON {
    "$schema" = "https://raw.githubusercontent.com/badlogic/pi-mono/main/packages/coding-agent/src/modes/interactive/theme/theme-schema.json";
    name = "custom";
    vars = theme.colors;
    colors = {
      accent = "mauve";
      border = "surface2";
      borderAccent = "mauve";
      borderMuted = "surface1";
      success = "green";
      error = "red";
      warning = "yellow";
      muted = "overlay2";
      dim = "overlay0";
      text = "";
      thinkingText = "overlay2";

      selectedBg = "surface0";
      userMessageBg = "surface0";
      userMessageText = "";
      customMessageBg = "mantle";
      customMessageText = "";
      customMessageLabel = "lavender";
      toolPendingBg = "mantle";
      toolSuccessBg = "#1e2e28";
      toolErrorBg = "#2e1e28";
      toolTitle = "blue";
      toolOutput = "overlay2";

      mdHeading = "peach";
      mdLink = "blue";
      mdLinkUrl = "overlay0";
      mdCode = "teal";
      mdCodeBlock = "green";
      mdCodeBlockBorder = "surface2";
      mdQuote = "overlay2";
      mdQuoteBorder = "surface2";
      mdHr = "surface2";
      mdListBullet = "teal";

      toolDiffAdded = "green";
      toolDiffRemoved = "red";
      toolDiffContext = "overlay2";

      syntaxComment = "overlay1";
      syntaxKeyword = "mauve";
      syntaxFunction = "blue";
      syntaxVariable = "flamingo";
      syntaxString = "green";
      syntaxNumber = "peach";
      syntaxType = "yellow";
      syntaxOperator = "sky";
      syntaxPunctuation = "overlay2";

      thinkingOff = "surface2";
      thinkingMinimal = "overlay0";
      thinkingLow = "sapphire";
      thinkingMedium = "teal";
      thinkingHigh = "mauve";
      thinkingXhigh = "pink";

      bashMode = "peach";
    };
    export = {
      pageBg = "crust";
      cardBg = "base";
      infoBg = "#3c3728";
    };
  };
}

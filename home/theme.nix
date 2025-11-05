{
  # Utility function to strip the # from hex colors
  rawHexValue = color: builtins.substring 1 6 color;

  # Edo color palette
  colors = {
    rosewater = "#C97D6E";
    flamingo = "#C98A7D";
    pink = "#BC76C1";
    mauve = "#6872AB";
    red = "#CB7676";
    maroon = "#CC8D82";
    peach = "#CC8D70";
    yellow = "#CC9B70";
    green = "#80A665";
    teal = "#5EA994";
    sky = "#5D9AA9";
    sapphire = "#6394BF";
    blue = "#687EAA";
    lavender = "#4C8E72";

    text = "#D8D6C9";
    subtext1 = "#B2B0A6";
    subtext0 = "#999895";
    overlay2 = "#7F7F7C";
    overlay1 = "#666666";
    overlay0 = "#4C4C4C";
    surface2 = "#333333";
    surface1 = "#232323";
    surface0 = "#1E1E1E";
    base = "#121212";
    mantle = "#0A0A0A";
    crust = "#000000";
  };

  # Git/delta diff colors
  diff = {
    hunkHeader = "#23273D";
    minusEmph = "#53394c";
    minus = "#34293a";
    plusEmph = "#404f4a";
    plus = "#2c3239";
    purple = "#494060";
    blue = "#384361";
    cyan = "#384d5d";
    yellow = "#544f4e";
  };

  # Editor UI colors
  ui = {
    findHighlight = "#3e5767";
  };
}

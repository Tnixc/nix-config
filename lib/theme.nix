{lib}: let
  colorMix = (import ../modules/utils/colors-mix.nix {inherit lib;}).mixColors;

  # Edo color palette
  colors = {
    rosewater = "#de9d9d";
    flamingo = "#dea89d";
    pink = "#b294bb";
    mauve = "#9d8bb8";
    red = "#cc6666";
    maroon = "#c67d7d";
    peach = "#de935f";
    yellow = "#f0c674";
    green = "#b5bd68";
    teal = "#8abeb7";
    sky = "#95b3c9";
    sapphire = "#7ea9b8";
    blue = "#81a2be";
    lavender = "#9db5c9";
    text = "#c5c8c6";
    subtext1 = "#a8aba9";
    subtext0 = "#8b8d8b";
    overlay2 = "#6f7271";
    overlay1 = "#5a5c5b";
    overlay0 = "#4d5057";
    surface2 = "#3a3c3f";
    surface1 = "#373b41";
    surface0 = "#282a2e";
    base = "#1d1f21";
    mantle = "#161719";
    crust = "#0f1011";
  };
in {
  # Utility function to strip the # from hex colors
  rawHexValue = color: builtins.substring 1 6 color;

  inherit colors;

  # Git/delta diff colors (computed from base colors)
  diff = {
    hunkHeader = colorMix colors.base colors.mauve 0.8;
    minusEmph = colorMix colors.base colors.red 0.6;
    minus = colorMix colors.base colors.red 0.8;
    plusEmph = colorMix colors.base colors.green 0.6;
    plus = colorMix colors.base colors.green 0.8;
    purple = colorMix colors.base colors.mauve 0.6;
    blue = colorMix colors.base colors.blue 0.6;
    cyan = colorMix colors.base colors.teal 0.6;
    yellow = colorMix colors.base colors.yellow 0.6;
  };

  # Editor UI colors
  ui = {
    findHighlight = colorMix colors.base colors.sky 0.5;
  };
}

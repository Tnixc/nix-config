{lib}:
with lib; let
  # Convert hex color to RGB object using fromTOML for hex parsing
  hexToRgb = hex: let
    hex' = removePrefix "#" (toLower hex);
    r = substring 0 2 hex';
    g = substring 2 2 hex';
    b = substring 4 2 hex';
    parseHex = s: (builtins.fromTOML "a = 0x${s}").a;
  in {
    r = parseHex r;
    g = parseHex g;
    b = parseHex b;
  };

  # Convert RGB object to hex color string
  rgbToHex = rgb:
    "#"
    + concatStrings (map (
      x: let
        s = toLower (toHexString x);
      in
        if stringLength s == 1
        then "0" + s
        else s
    ) [rgb.r rgb.g rgb.b]);

  round = x: let
    floor = builtins.floor x;
    ceil = builtins.ceil x;
  in
    if (x - floor) < 0.5
    then floor
    else ceil;

  # Mix two colors with given factor
  mixColors = color1: color2: factor: let
    c1 = hexToRgb color1;
    c2 = hexToRgb color2;
    mix = {
      r = round ((c1.r * factor) + (c2.r * (1.0 - factor)));
      g = round ((c1.g * factor) + (c2.g * (1.0 - factor)));
      b = round ((c1.b * factor) + (c2.b * (1.0 - factor)));
    };
  in
    rgbToHex mix;
in {
  inherit mixColors;
}

{pkgs, ...}: let
  theme = import ../../theme.nix;
  c = theme.colors;
  strip = theme.rawHexValue;
in {
  programs.ghostty = {
    enable = true;
    package = pkgs.ghostty-bin;

    settings = {
      # Basic behavior
      shell-integration = "detect";
      scrollback-limit = 2000000000;
      window-inherit-working-directory = false;
      command = "/run/current-system/sw/bin/fish";

      # Font
      font-family = "BerkeleyMono Nerd Font";
      font-thicken = true;
      font-size = 13.5;
      font-feature = ["-calt" "-liga" "-dlig"];
      adjust-cell-height = "77%";
      adjust-underline-thickness = "10%";
      adjust-underline-position = 3;

      # Cursor
      cursor-style = "underline";

      # macOS specific
      macos-option-as-alt = true;
      macos-icon = "holographic";
      macos-titlebar-style = "tabs";

      # Colors (edo theme)
      foreground = strip c.text;
      background = strip c.base;
      selection-foreground = strip c.text;
      selection-background = strip c.surface2;
      cursor-color = strip c.rosewater;
      cursor-text = strip c.crust;

      # Palette
      palette = [
        "0=${strip c.surface1}"
        "1=${strip c.red}"
        "2=${strip c.green}"
        "3=${strip c.yellow}"
        "4=${strip c.blue}"
        "5=${strip c.pink}"
        "6=${strip c.teal}"
        "7=${strip c.text}"
        "8=${strip c.surface2}"
        "9=${strip c.red}"
        "10=${strip c.green}"
        "11=${strip c.yellow}"
        "12=${strip c.blue}"
        "13=${strip c.pink}"
        "14=${strip c.teal}"
        "15=${strip c.text}"
      ];

      # Transparency
      background-opacity = 0.95;
      background-blur-radius = 94;
      alpha-blending = "native";
      window-colorspace = "display-p3";

      # Window title
      window-title-font-family = "BerkeleyMono Nerd Font";
    };
  };
}

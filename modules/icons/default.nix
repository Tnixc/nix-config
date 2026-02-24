{username, ...}: {
  # App icons (darwin-custom-icons)
  environment.customIcons = {
    enable = true;
    icons = [
      {
        path = "/Applications/Cloudflare WARP.app";
        icon = ./cf_warp.icns;
      }
      {
        path = "/System/Volumes/Data/Applications/AltTab.app";
        icon = ./alttab.icns;
      }
      {
        path = "/Applications/Nix Apps/kitty.app";
        icon = ./kitty.png;
      }
    ];
  };



  # File extension icons (fs-icon)
  # environment.fileExtensionIcons = {
  #   enable = true;
  #   appName = "fsicon";
  #   bundleId = "dev.tnixc.fsicon";
  #
  #   preset = "material";
  # };
}

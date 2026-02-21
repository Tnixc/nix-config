{...}: {
  # App icons (darwin-custom-icons)
  environment.customIcons = {
    enable = true;
    icons = [
      {
        path = "/Applications/Cloudflare WARP.app";
        icon = ./cf_warp.icns;
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

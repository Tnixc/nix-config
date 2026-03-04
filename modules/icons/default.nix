{...}: {
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
    ];
  };
}

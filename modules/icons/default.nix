{...}: {
  environment.customIcons = {
    enable = true;
    icons = [
      {
        path = "/Applications/Nix Apps/kitty.app/";
        icon = ./kitty.icns;
      }
    ];
  };
}

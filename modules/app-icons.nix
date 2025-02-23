{...}: {
  environment.customIcons = {
    enable = true;
    icons = [
      {
        path = "/Applications/Nix Apps/kitty.app/";
        icon = ./icons/kitty.icns;
      }
    ];
  };
}

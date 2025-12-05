{...}: {
  # App icons (darwin-custom-icons)
  environment.customIcons = {
    enable = true;
    icons = [
      {
        path = "/System/Volumes/Data/Applications/kitty.app";
        icon = ./kitty.icns;
      }
      {
        path = "/System/Volumes/Data/Applications/Balatro.app";
        icon = ./balatro.icns;
      }
      {
        path = "/System/Volumes/Data/Applications/Vesktop.app";
        icon = ./vesktop.icns;
      }
      {
        path = "/System/Volumes/Data/Applications/equibop.app";
        icon = ./equibop.icns;
      }
      {
        path = "/System/Volumes/Data/Applications/Ghostty.app";
        icon = ./ghostty.icns;
      }
    ];
  };

  # File extension icons (fs-icon)
  environment.fileExtensionIcons = {
    enable = true;
    appName = "fsicon";
    bundleId = "dev.tnixc.fsicon";

    fileTypes = [
      {
        extension = "custom";
        description = "Nix File";
        icon = ./nix.icns;
        utType = "com.nixos.nix-file";
        conformsTo = ["public.plain-text" "public.source-code"];
        handlerRank = "Owner";
        role = "Viewer";
      }
    ];
  };
}

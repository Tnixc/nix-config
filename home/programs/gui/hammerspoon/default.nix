{pkgs, ...}: let
  paperwm = pkgs.fetchFromGitHub {
    owner = "mogenson";
    repo = "PaperWM.spoon";
    rev = "e9e78a68fce3d88e5ab67dbc636c23c591a7202c";
    hash = "sha256-FFLrvbF71vjCrLnsEl+6M5kuuirhPIjpk5XAqE2LgVA=";
  };
  swipe = pkgs.fetchFromGitHub {
    owner = "mogenson";
    repo = "Swipe.spoon";
    rev = "c56520507d98e663ae0e1228e41cac690557d4aa";
    hash = "sha256-G0kuCrG6lz4R+LdAqNWiMXneF09pLI+xKCiagryBb5k=";
  };
in {
  home.file = {
    ".hammerspoon/Spoons/PaperWM.spoon" = {
      source = paperwm;
      recursive = true;
    };
    ".hammerspoon/Spoons/Swipe.spoon" = {
      source = swipe;
      recursive = true;
    };
    ".hammerspoon/init.lua".source = ./init.lua;
  };
}

{pkgs, ...}: let
  paperwm = pkgs.fetchFromGitHub {
    owner = "mogenson";
    repo = "PaperWM.spoon";
    rev = "c2029a8819ad35d2bf1f3128d0e668ca0b6f5074";
    hash = "sha256-gmj5hxIX3uLy7iOiRzUtknT0TgwlRig9l1ZgmscF5t0=";
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

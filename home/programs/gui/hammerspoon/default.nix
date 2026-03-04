{pkgs, ...}: let
  paperwm = pkgs.fetchFromGitHub {
    owner = "mogenson";
    repo = "PaperWM.spoon";
    rev = "8a7ab83dd48b6d1b0e22359c41e788ef55871295";
    hash = "sha256-PdG/fv2j4HMksePIEzWFaZHOP0OEvImh8sEEBwPLfd8=";
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

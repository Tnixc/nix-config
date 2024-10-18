{ ... }:
{
  home.file.".config/kitty" = {
    source = ./kitty;
    recursive = true;
  };
}

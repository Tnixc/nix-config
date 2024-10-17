{ ... }:
{
  home.file.".config/kitty" = {
    source = ./src;
    recursive = true;
  };
}

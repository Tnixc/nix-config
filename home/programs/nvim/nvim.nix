{ ... }:
{
  home.file.".config/nvim" = {
    source = ./src;
    recursive = true;
  };
}

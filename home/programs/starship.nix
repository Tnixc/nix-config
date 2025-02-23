{lib, ...}: let
  color-mix = import ../../modules/utils/colors-mix.nix {inherit lib;};

  # Define your base colors
  primary = "#00ff00";
  secondary = "#ff0000";

  # Mix the colors (70% of primary, 30% of secondary)
  mixedColor = color-mix.mixColors primary secondary 0.7;
in {
  programs.starship = {
    enable = true;

    enableBashIntegration = true;
    enableZshIntegration = true;
    enableNushellIntegration = true;

    settings = {
      format = " $hostname$shell$directory$git_branch$git_status$character";

      directory = {
        style = "blue";
        format = "[$path ]($style)";
        truncation_length = 99;
        truncation_symbol = "…/";
        truncate_to_repo = false;
      };

      git_branch = {
        symbol = "󰘬";
        format = "[ [$symbol](bold green bg:${mixedColor}) $branch ](bg:${mixedColor} green)";
      };

      git_status = {
        disabled = false;
        ignore_submodules = false;
        ahead = "[󰁞($count) ](blue)";
        behind = "[󰁆($count) ](yellow)";
        deleted = "[($count) ](red)";
        diverged = "[($count) ](red)";
        format = "[ $all_status$ahead_behind]()";
        modified = "[~($count) ](yellow)";
        renamed = "[/($count) ](purple)";
        staged = "[+($count) ](cyan)";
        stashed = "[=($count) ](blue)";
      };

      character = {
        disabled = false;
        success_symbol = "[](bold green)";
        error_symbol = "[](bold red)";
      };

      shell = {
        zsh_indicator = " zsh";
        nu_indicator = " nu";
        fish_indicator = "";
        unknown_indicator = "";
        style = "yellow";
        disabled = false;
      };

      line_break = {
        disabled = false;
      };

      hostname = {
        ssh_only = false;
        format = "[$hostname]($style)";
        style = "bold cyan";
      };
    };
  };
}

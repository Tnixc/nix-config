{ ... }:
{
  programs.starship = {
    enable = true;

    enableBashIntegration = true;
    enableZshIntegration = true;
    enableNushellIntegration = true;

    settings = {
      format = " $hostname $directory$git_branch$git_status$character";

      directory = {
        style = "blue";
        format = "[$path ]($style)";
        truncation_length = 99;
        truncation_symbol = "…/";
        truncate_to_repo = false;
      };

      git_branch = {
        symbol = "󰘬";
        format = "[ $symbol $branch ](bg:#303d46 green bold)";
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

      # shell = {
      #   zsh_indicator = "zsh";
      #   nu_indicator = "nu";
      #   unknown_indicator = "<?>";
      #   style = "yellow";
      #   disabled = false;
      # };

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

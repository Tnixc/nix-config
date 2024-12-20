{ pkgs, ... }:
{
  programs.fish = {
    enable = true;
    interactiveShellInit = ''

      # TokyoNight Color Palette
      set -l foreground BECAF9
      set -l selection 363A4F
      set -l comment 6E738D
      set -l red FF6A7B
      set -l orange FF9856
      set -l yellow E9AD5B
      set -l green 90D05A
      set -l purple C198FD
      set -l cyan 62E4FF
      set -l pink FF9ED0

      # Syntax Highlighting Colors
      set -g fish_color_normal $foreground
      set -g fish_color_command $green
      set -g fish_color_keyword $pink set -g fish_color_quote $yellow
      set -g fish_color_redirection $foreground
      set -g fish_color_end $orange
      set -g fish_color_option $pink
      set -g fish_color_error $red
      set -g fish_color_param $purple
      set -g fish_color_comment $comment
      set -g fish_color_selection --background=$selection
      set -g fish_color_search_match --background=$selection
      set -g fish_color_operator $green
      set -g fish_color_escape $pink
      set -g fish_color_autosuggestion $comment

      # Completion Pager Colors
      set -g fish_pager_color_progress $comment
      set -g fish_pager_color_prefix $cyan
      set -g fish_pager_color_completion $foreground
      set -g fish_pager_color_description $comment
      set -g fish_pager_color_selected_background --background=$selection

      set -x EDITOR nvim
      set -x LLVM_PROFILE_FILE "/dev/null"
      set -x BUN_INSTALL "$HOME/.bun"
      fish_add_path $BUN_INSTALL/bin
      fish_add_path $HOME/.cargo/bin
      fish_add_path $HOME/.bun/bin
      fish_add_path $HOME/.local/bin
      fish_add_path /opt/homebrew/bin
      fish_add_path /run/current-system/sw/bin

      set -Ux FZF_DEFAULT_OPTS "\
      --color=bg+:#363A4F,spinner:#FAA296,hl:#FF6A7B \
      --color=fg:#BECAF9,header:#FF6A7B,info:#C198FD,pointer:#FAA296 \
      --color=marker:#8995FF,fg+:#BECAF9,prompt:#C198FD,hl+:#FF6A7B \
      --color=selected-bg:#494D64 \
      --multi"

      bind \eh backward-word
      bind \el forward-word

      set -g fish_greeting

      fzf --fish | source
      zoxide init fish | source
    '';
    functions = {
      gc = "git commit -m $argv[1]";
    };
  };
  home.shellAliases = {
    a = "nvim";
    vim = "nvim";
    vi = "nvim";

    q = "exit";

    ga = "git add -A";
    lz = "lazygit";
    gz = "nvim +DiffviewOpen";
    g = "git";

    ls = "eza --icons --group-directories-first";
    l = "eza --icons -la --no-user --no-time --no-permissions --git --group-directories-first";
    lr = "eza --icons -laR --git-ignore --git --no-user --no-time --no-permissions --group-directories-first";
    tree = "eza --icons --tree --git-ignore";
    treea = "eza --icons --tree -a";

    cd = "z";
    f = "open .";
    rm = "trash";
    bs = "brew services";
    icat = "kitten icat --align left";

    swd = "cd ~/nix-config ; make ; cd - >> /dev/null";
  };
}

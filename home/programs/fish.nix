{ pkgs, ... }:
{
  programs.fish = {
    enable = true;
    interactiveShellInit = ''

      # Color Palette
      set -l foreground C5C9C5
      set -l selection  2A2A37
      set -l comment    51516b
      set -l red        E46876
      set -l orange     E6A96D
      set -l yellow     E6C384
      set -l green      87A987
      set -l purple     A292A3
      set -l cyan       7FB4CA
      set -l pink       D98AAD

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
      --color=bg+:#2A2A37,spinner:#E6A5C9,hl:#E46876 \
      --color=fg:#C5C9C5,header:#E46876,info:#A292A3,pointer:#E6A5C9 \
      --color=marker:#938AA9,fg+:#C5C9C5,prompt:#A292A3,hl+:#E46876 \
      --color=selected-bg:#3a3a4c \
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

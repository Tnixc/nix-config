{pkgs, ...}: {
  programs.fish = {
    enable = true;
    interactiveShellInit = ''
      # Color Palette
      set -l foreground D8D6C9
      set -l selection  2A2A37
      set -l comment    51516b
      set -l red        CB7676
      set -l orange     CC8D70
      set -l yellow     CC9B70
      set -l green      80A665
      set -l purple     6872AB
      set -l cyan       5D9AA9
      set -l pink       BC76C1

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
      fish_add_path /usr/local/bin
      fish_add_path /opt/homebrew/bin
      fish_add_path /run/current-system/sw/bin

      set -Ux FZF_DEFAULT_OPTS "\
      --color=bg+:#1E1E1E,spinner:#C97D6E,hl:#CB7676 \
      --color=fg:#D8D6C9,header:#CB7676,info:#6872AB,pointer:#C97D6E \
      --color=marker:#4C8E72,fg+:#D8D6C9,prompt:#6872AB,hl+:#CB7676 \
      --color=selected-bg:#232323 \
      --multi"

      bind \eh backward-word
      bind \el forward-word

      set -g fish_greeting
      set TERM xterm-256color

      fzf --fish | source
      zoxide init fish | source

      # BEGIN opam configuration
      # This is useful if you're using opam as it adds:
      #   - the correct directories to the PATH
      #   - auto-completion for the opam binary
      # This section can be safely removed at any time if needed.
      test -r '/Users/tnixc/.opam/opam-init/init.fish' && source '/Users/tnixc/.opam/opam-init/init.fish' > /dev/null 2> /dev/null; or true
      # END opam configuration

    '';
    functions = {
      gc = "git commit -m $argv[1]";
    };
  };
  home.shellAliases = {
    a = "nvim";

    q = "exit";

    ga = "git add -A";
    lz = "lazygit";
    gz = "nvim +DiffviewOpen";
    g = "git";
    j = "just";

    nvs = "rm \"/Users/tnixc/.local/share/nvim/sessions/$(pwd | sed 's|/|%2F|g').vim\"";

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

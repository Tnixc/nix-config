{pkgs, ...}: let
  theme = import ../theme.nix;
  c = theme.colors;
  strip = theme.rawHexValue;
in {
  programs.fish = {
    enable = true;
    interactiveShellInit = ''
      # Color Palette from theme.nix
      set -l foreground ${strip c.text}
      set -l selection  2A2A37
      set -l comment    51516b
      set -l red        ${strip c.red}
      set -l orange     ${strip c.peach}
      set -l yellow     ${strip c.yellow}
      set -l green      ${strip c.green}
      set -l purple     ${strip c.mauve}
      set -l cyan       ${strip c.sky}
      set -l pink       ${strip c.pink}

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
      fish_add_path /usr/local/texlive/2025/bin/universal-darwin

      set -Ux FZF_DEFAULT_OPTS "\
      --color=bg+:${c.surface0},spinner:${c.rosewater},hl:${c.red} \
      --color=fg:${c.text},header:${c.red},info:${c.mauve},pointer:${c.rosewater} \
      --color=marker:${c.lavender},fg+:${c.text},prompt:${c.mauve},hl+:${c.red} \
      --color=selected-bg:${c.surface1} \
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

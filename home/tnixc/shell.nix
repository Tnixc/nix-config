{...}: let
  theme = import ./theme.nix;
  c = theme.colors;
in {
  # Shared environment variables for all shells
  home.sessionVariables = {
    EDITOR = "nvim";
    LLVM_PROFILE_FILE = "/dev/null";
    TERM = "xterm-256color";

    # FZF theme configuration (works in all shells)
    FZF_DEFAULT_OPTS = ''
      --color=bg+:${c.surface0},spinner:${c.rosewater},hl:${c.red} \
      --color=fg:${c.text},header:${c.red},info:${c.mauve},pointer:${c.rosewater} \
      --color=marker:${c.lavender},fg+:${c.text},prompt:${c.mauve},hl+:${c.red} \
      --color=selected-bg:${c.surface1} \
      --multi
    '';
  };

  # Shared PATH additions (applies to all shells)
  home.sessionPath = [
    "$HOME/.bun/bin"
    "$HOME/.cargo/bin"
    "$HOME/.local/bin"
    "/opt/homebrew/bin"
    "/usr/local/bin"
    "/usr/local/texlive/2025/bin/universal-darwin"
  ];

  # Shared shell aliases (works for all shells)
  home.shellAliases = {
    # Editor
    a = "nvim";
    q = "exit";

    # Git shortcuts
    cat = "bat";
    ga = "git add -A";
    lz = "lazygit";
    gz = "nvim +DiffviewOpen";
    g = "git";
    j = "just";

    # Neovim session cleanup
    nvs = "rm \"/Users/tnixc/.local/share/nvim/sessions/$(pwd | sed 's|/|%2F|g').vim\"";

    # File listing (eza)
    ls = "eza --icons --group-directories-first";
    l = "eza --icons -la --no-user --no-time --no-permissions --git --group-directories-first";
    lr = "eza --icons -laR --git-ignore --git --no-user --no-time --no-permissions --group-directories-first";
    tree = "eza --icons --tree --git-ignore";
    treea = "eza --icons --tree -a";

    # File operations
    f = "open .";
    rm = "trash";

    # Misc
    bs = "brew services";
    icat = "kitten icat --align left";
  };
}

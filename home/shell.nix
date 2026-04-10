{theme, ...}: let
  c = theme.colors;
in {
  # Shared environment variables for all shells
  home.sessionVariables = {
    EDITOR = "nvim";
    LLVM_PROFILE_FILE = "/dev/null";
    TERM = "xterm-kitty";
    MANPAGER = "nvim +Man!";
  };

  # Shared PATH additions (applies to all shells)
  home.sessionPath = [
    "/run/current-system/sw/bin"
    "/nix/var/nix/profiles/default/bin"
    "/opt/homebrew/bin"
    "/usr/local/bin"
    "/etc/profiles/per-user/$USER/bin"
    "$HOME/.vite-plus/bin"
    "$HOME/.nix-profile/bin"
    "$HOME/.bun/bin"
    "$HOME/.cargo/bin"
    "$HOME/.local/bin"
    "$HOME/.craft/bin"
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
    gc = "git commit -m";

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

    pcp = "pbcopy";
    ppy = "pbpaste";
  };

  # Use home-manager's fzf and zoxide integration
  programs.fzf = {
    enable = true;
    enableZshIntegration = true;
    enableFishIntegration = true;
    colors = {
      "bg+" = c.surface0;
      spinner = c.rosewater;
      hl = c.red;
      fg = c.text;
      header = c.red;
      info = c.mauve;
      pointer = c.rosewater;
      marker = c.lavender;
      "fg+" = c.text;
      prompt = c.mauve;
      "hl+" = c.red;
      "selected-bg" = c.surface1;
    };
    defaultOptions = ["--multi"];
  };

  programs.zoxide = {
    enable = true;
    enableZshIntegration = true;
    enableFishIntegration = true;
  };
}

{pkgs, ...}: {
  nixpkgs.config.allowUnfree = true;
  environment.systemPackages = with pkgs; [
    # Terminal and File Management
    pueue
    ranger
    kitty
    btop
    bat
    tldr
    eza
    zoxide
    fzf
    television
    skim
    jq
    ripgrep
    fd
    tokei
    hyperfine
    wget
    fastfetch
    gum
    license-cli
    comma
    fish
    direnv
    helix

    # Version Control and Development Tools
    git
    lazygit
    delta
    gh
    docker
    colima # docker daemon

    # Window Management (macOS)
    # yabai
    # aerospace
    # skhd
    # jankyborders
    sketchybar-app-font

    # Shell Customization
    starship

    # Programming Languages and Runtimes
    lua
    elixir
    python3
    go
    # zig
    gleam

    # Language-specific Tools
    stylua
    rustup
    cargo-binstall
    pipx
    poetry
    uv
    nrr
    jdk23

    # Media and Entertainment
    ani-cli
    mangal
    aria2
    yt-dlp
    ffmpeg
    iina

    # Content Creation and Note-taking
    zola
    obsidian

    # Font Tools
    python312Packages.fonttools
    fontforge-fonttools
    brotli
    zopfli

    # Package Managers
    yarn
  ];
  homebrew = {
    enable = true;

    onActivation = {
      autoUpdate = false;
      # 'zap': uninstalls all formulae(and related files) not listed here.
      cleanup = "zap";
    };

    taps = [
      "homebrew/services"
      "FelixKratz/formulae"
      "mrkai77/cask"
      "socsieng/tap"
    ];

    # `brew install`
    brews = [
      "deno"
      "supabase/tap/supabase"
      "jupyterlab"
      "node"
      "neovim"
      "nowplaying-cli"
      "switchaudio-osx"
      # "sketchybar"
      "lua"
      "brightness"
      "macos-trash"
      "sendkeys"
      "dprint"
      "yazi"
      "spotify_player"
      "zig"
    ];

    # `brew install --cask`
    casks = [
      "tableplus"
      "eloston-chromium"
      "linearmouse"
      "nordvpn"
      "zed"
      "loop"
      "motrix"
      "alt-tab"
      "shottr"
      "sf-symbols"
      "font-sf-mono"
      "font-sf-pro"
      "visual-studio-code"
    ];
  };
}

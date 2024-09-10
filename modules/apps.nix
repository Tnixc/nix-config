{ pkgs, ... }: {
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
    stow
    fzf
    skim
    jq
    ripgrep
    loc
    hyperfine
    wget
    fastfetch
    gum

    # Version Control and Development Tools
    git
    lazygit
    gh
    docker
    colima # docker daemon

    # Window Management (macOS)
    yabai
    skhd
    jankyborders
    sketchybar-app-font

    # Shell Customization
    starship

    # Programming Languages and Runtimes
    lua
    elixir
    python3
    go
    zig
    nodejs_22

    # Language-specific Tools
    stylua
    rustup
    cargo-binstall
    pipx
    poetry

    # Databases
    postgresql

    # Virtualization
    qemu

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

    # java
  ];
  homebrew = {
    enable = false;

    onActivation = {
      autoUpdate = false;
      # 'zap': uninstalls all formulae(and related files) not listed here.
      cleanup = "zap";
    };

    taps = [
      "homebrew/services"
      "PlayCover/playcover"
      "FelixKratz/formulae"
      "mrkai77/cask"
      "socsieng/tap"
    ];

    # `brew install`
    brews = [
      "neovim"
      "nowplaying-cli"
      "switchaudio-osx"
      "sketchybar"
      "lua"
      "brightness"
      "macos-trash"
      "sendkeys"
      "dprint"
      "gdb"
      "aarch64-elf-gcc"
      "aarch64-elf-gdb"
      "yazi"
      "spotify_player"
      "openjdk"
    ];

    # `brew install --cask`
    casks = [
      "playcover-community"
      "betterdisplay"
      "eloston-chromium"
      "linearmouse"
      "jordanbaird-ice"
      "nordvpn"
      "zed"
      "orion"
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

{ pkgs, ... }: {
  nixpkgs.config.allowUnfree = true;
  environment.systemPackages = with pkgs; [
    pueue
    git
    ranger

    yabai
    skhd
    jankyborders
    sketchybar-app-font

    kitty

    docker
    colima # docker daemon

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

    starship
    lazygit
    gh

    lua
    stylua

    elixir
    postgresql

    rustup
    cargo-binstall

    python3
    pipx
    poetry

    go

    zig

    ani-cli
    mangal

    aria2
    yt-dlp
    ffmpeg
    iina

    zola
    obsidian

    python312Packages.fonttools
    fontforge-fonttools
    brotli
    zopfli

    nodejs_22
    yarn
  ];

  #cargo
  #rustfmt
  #rustc
  #rust-analyzer all handled by rustup

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
    ];
  };
}

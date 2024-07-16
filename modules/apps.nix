{ pkgs, ... }:
{
  nixpkgs.config.allowUnfree = true;
  environment.systemPackages = with pkgs; [
    pueue
    git

    yabai
    skhd
    sketchybar-app-font

    kitty

    docker
    colima # docker daemon

    btop
    bat
    eza
    zoxide
    stow
    fzf
    jq
    ripgrep
    neovim
    loc
    hyperfine
    wget
    fastfetch
    gum

    starship
    lazygit
    gh

    lua

    ani-cli
    stylua

    elixir
    postgresql

    rustup

    python3
    poetry

    go

    zig

    ani-cli
    aria2
    yt-dlp
    ffmpeg
    iina

    zola
    obsidian
  ];

    #cargo
    #rustfmt
    #rustc
    #rust-analyzer all handled by rustup

  homebrew = {
    enable = true;

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
      "nowplaying-cli"
      "switchaudio-osx"
      "sketchybar"
      "lua"
      "brightness"
      "macos-trash"
      "sendkeys"
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

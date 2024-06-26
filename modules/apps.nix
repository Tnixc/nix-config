{ pkgs, ...}: {
  nixpkgs.config.allowUnfree = true;
  environment.systemPackages = with pkgs; [
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

    starship
    lazygit
    gh

    lua

    cargo
    rustfmt
    rustc
    rust-analyzer

    python3
    poetry

    go
  ];

  homebrew = {
    enable = true;

    onActivation = {
      autoUpdate = true;
      # 'zap': uninstalls all formulae(and related files) not listed here.
      cleanup = "zap";
    };

    taps = [
      "homebrew/services"
      "FelixKratz/formulae"
      "mrkai77/cask"
    ];

    # `brew install`
    brews = [
        "nowplaying-cli"
        "switchaudio-osx"
        "sketchybar"
        "lua"
        "macos-trash"
    ];

    # `brew install --cask`
    casks = [
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

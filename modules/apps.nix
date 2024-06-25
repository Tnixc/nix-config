{ pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    git

    yabai
    skhd
    sketchybar-app-font

    kitty

    docker
    colima # docker daemon

    btop
    eza
    zoxide
    stow
    fzf
    jq
    ripgrep
    neovim

    starship
    lazygit
    gh

    bun

    lua
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
    ];

    # `brew install`
    brews = [
        "nowplaying-cli"
        "switchaudio-osx"
        "sketchybar"
        "lua"
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

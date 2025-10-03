{
  pkgs,
  pwaerospace,
  sketchybar-config,
  ...
}: {
  nixpkgs.config.allowUnfree = true;
  environment.systemPackages = with pkgs; [
    pwaerospace.packages.aarch64-darwin.aerospace-standalone
    sketchybar-config.packages.aarch64-darwin.sketchybar-standalone

    # dev tools
    pueue
    nix-output-monitor
    btop
    bat
    tldr
    eza
    starship
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
    comma
    fish
    direnv
    helix
    git
    lazygit
    delta
    gh
    docker
    # dioxus-cli
    sketchybar-app-font
    ast-grep
    zellij
    just
    dua

    # Languages
    lua
    elixir
    python3
    go
    gleam
    stylua
    rustup
    cargo-binstall
    pipx
    uv
    nrr
    yarn
    jdk23
    wasmer
    wasmtime
    meson
    act
    pnpm
    ninja
    micropython
    rshell

    git-crypt

    # media / others
    ani-cli
    mangal
    aria2
    yt-dlp
    ffmpeg

    # Font things
    python312Packages.fonttools
    fontforge-fonttools
    brotli
    zopfli
  ];

  homebrew = {
    enable = true;

    onActivation = {
      autoUpdate = false;
      # 'zap': uninstalls all formulae(and related files) not listed here.
      # cleanup = "zap";
    };

    taps = [
      "homebrew/services"
      "FelixKratz/formulae"
      "mrkai77/cask"
      "socsieng/tap"
      "sst/tap"
      "charmbracelet/tap"
    ];

    # `brew install`
    brews = [
      "sst/tap/opencode"
      "charmbracelet/tap/crush"
      "emscripten"
      "deno"
      "supabase/tap/supabase"
      "jupyterlab"
      "node"
      "neovim"
      "nowplaying-cli"
      "switchaudio-osx"
      "lua"
      "brightness"
      "macos-trash"
      "sendkeys"
      "dprint"
      "yazi"
      "spotify_player"
      "zig"
      "openssl"
      "ghc"
      "opam"
      "gnupg"
      "rustywind"
      "vercel-cli"
      "swift-format"
      "coreutils"
      "readline"
      "xz"
      "zlib"
      "llvm"
      "ninja"
      "colima"
      "pdfcpu"
      "qpdf"
      "cpdf"
      "xcodegen"
      "swiftlint"
      "swiftformat"
      "xcbeautify"
    ];

    # `brew install --cask`
    casks = [
      "loop"
      "racket"
      "calibre"
      "parsec"
      "spotify"
      "cursor"
      "hammerspoon"
      "obsidian"
      "steam"
      "tableplus"
      # "eloston-chromium"
      "google-chrome"
      "microsoft-edge"
      "reminders-menubar"
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
      "kitty"
      "craft"
      "yaak"
      "iina"
      "tailscale-app"
    ];
  };
}

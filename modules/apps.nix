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

    # languages and runtimes
    lua
    elixir
    python3
    go
    gleam
    stylua
    (rust-bin.nightly."2025-11-05".default.override {
      extensions = ["rust-src" "rust-analyzer"];
    })
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
    conan

    # media
    ani-cli
    mangal
    aria2
    yt-dlp
    ffmpeg

    # python
    python313Packages.mako

    # Font Tools
    python312Packages.fonttools
    fontforge-fonttools
    brotli
    zopfli

    # misc
    git-crypt
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
      "zegervdv/zathura"
      "keith/formulae"
      "mmazzarolo/formulae"
      "supabase/tap"
    ];

    # `brew install`
    brews = [
      # compression
      "xz"
      "zlib"

      # system utils
      "brightness"
      "coreutils"
      "colima"
      "dua-cli"
      "lsusb"
      "macos-trash"
      "switchaudio-osx"

      # dev tools
      "clang-format"
      "cmake"
      "cpdf"
      "dprint"
      "git-lfs"
      "gitui"
      "gnupg"
      "just"
      "llvm"
      "neovim"
      "nmap"
      "pdfcpu"
      "protobuf"
      "qpdf"
      "xcbeautify"
      "xcodegen"
      "yazi"
      "zig"

      # languages and runtimes
      "cocoapods"
      "deno"
      "emscripten"
      "ghc"
      "lua"
      "node"
      "opam"
      "python@3.13"

      # graphics and libraries
      "glfw"
      "glm"
      "glslang"
      "libavif"
      "libsoundio"
      "raylib"
      "sdl2"
      "spirv-tools"

      # utilities
      "jupyterlab"
      "nowplaying-cli"
      "vercel-cli"
      "woff2"

      # build tools
      "ninja"

      # media and audio
      "sherlock"
      "spotify_player"
      "rustywind"
      "swift-format"
      "swiftformat"
      "swiftlint"

      # taps
      "charmbracelet/tap/crush"
      "socsieng/tap/sendkeys"
      "sst/tap/opencode"
      "supabase/tap/supabase"
      "zegervdv/zathura/zathura"
      "zegervdv/zathura/zathura-pdf-mupdf"
    ];

    # `brew install --cask`
    casks = [
      # productivity
      "alt-tab"
      "hammerspoon"
      "jordanbaird-ice"
      "kitty"
      "leader-key"
      "linearmouse"
      "loop"
      "reminders-menubar"
      "stats"
      "tableplus"
      "tailscale-app"
      "chatgpt"

      # development
      "cursor"
      "racket"
      "visual-studio-code"
      "yaak"
      "zed"

      # browsers
      "google-chrome"
      "microsoft-edge"

      # media
      "calibre"
      "iina"
      "obsidian"
      "parsec"
      "shottr"
      "spotify"
      "steam"
      "zotero@beta"

      # design and writing
      "craft"
      "eul"
      "flashspace"

      # fonts
      "font-maple-mono"
      "font-maple-mono-nf"
      "font-sf-mono"
      "font-sf-pro"
      "sf-symbols"

      # utilities
      "motrix"
      "nordvpn"
      "texshop"
    ];
  };
}

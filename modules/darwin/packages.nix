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

    # CLI & Shell
    fish
    kitty
    starship
    zoxide
    fzf
    direnv
    btop
    fastfetch
    nix-output-monitor
    bat
    eza
    ripgrep
    sd
    fd
    tldr
    jq
    wget
    yazi
    delta
    tokei
    hyperfine
    dua
    chafa
    nowplaying-cli
    pdfcpu
    comma
    git
    git-lfs
    git-crypt
    lazygit
    gh
    coreutils
    # charm-freeze

    # Code Editors & IDEs
    neovim
    vscode
    code-cursor

    # Build Tools & Task Runners
    cmake
    meson
    ninja
    just
    # act

    # Languages & Package Managers
    python3
    lua
    # elixir
    go
    # gleam
    micropython
    (rust-bin.nightly."2025-11-05".default.override {
      extensions = ["rust-src"];
    })
    zig
    llvm
    clang-tools
    cargo-binstall
    pipx
    uv
    nrr
    pnpm
    yarn
    # conan

    # WebAssembly
    # wasmer
    # wasmtime

    # Graphics & Multimedia Libraries
    # glfw
    # glm
    # glslang
    # raylib
    # SDL2
    libavif
    libsoundio
    # spirv-tools

    # Media Tools
    ffmpeg
    # yt-dlp
    iina

    # Code Quality & Formatting
    swiftformat
    stylua
    topiary
    # ast-grep

    # Development Tools - macOS
    xcodegen
    switchaudio-osx
    darwin.lsusb

    # Apps
    shottr
    ice-bar
    # vesktop  # fails to build on macOS (codesign not available in sandbox)
    obsidian

    # Containerization
    ollama
    docker
    colima

    # Security & Crypto
    gnupg

    # Compression & Archives
    xz
    zlib

    # Network Tools
    nmap

    # Fonts
    # maple-mono.NF (doesnt work)
  ];
}

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
    # pueue
    nix-output-monitor
    btop
    bat
    tldr
    eza
    starship
    zoxide
    fzf
    # television
    # skim
    jq
    ripgrep
    fd
    tokei
    hyperfine
    wget
    fastfetch
    # gum
    comma
    fish
    direnv
    helix
    git
    lazygit
    delta
    gh
    docker
    # sketchybar-app-font
    ast-grep
    # zellij
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
      extensions = ["rust-src"];
    })
    cargo-binstall
    pipx
    uv
    nrr
    yarn
    wasmer
    wasmtime
    meson
    act
    pnpm
    ninja
    micropython
    rshell
    conan

    # ani-cli
    # mangal
    # aria2
    yt-dlp
    ffmpeg
    # dwt1-shell-color-scripts
    chafa

    # Font Tools
    # python312Packages.fonttools
    # fontforge-fonttools
    # brotli
    # zopfli

    # misc
    git-crypt
    shottr
    topiary

    xz
    zlib
    colima
    darwin.lsusb
    switchaudio-osx
    cmake

    git-lfs
    gnupg
    just
    llvm
    neovim
    nmap
    pdfcpu
    xcodegen
    yazi
    zig
    opam

    glfw
    glm
    glslang
    libavif
    libsoundio
    raylib
    SDL2
    spirv-tools
    nowplaying-cli
    ninja
    swiftformat

    crush
    opencode

    alt-tab-macos
    karabiner-elements
    ice-bar
    kitty
    loopwm
    vesktop
    vscode
    code-cursor
    zed-editor

    iina
    obsidian
    flashspace

    maple-mono.NF
  ];
}

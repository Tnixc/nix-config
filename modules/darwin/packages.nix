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
    gdb

    # media
    ani-cli
    mangal
    aria2
    yt-dlp
    ffmpeg
    dwt1-shell-color-scripts
    chafa

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
}

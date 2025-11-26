{...}: {
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
      "keith/formulae/reminders-cli"
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
      "orion"
      "vesktop"

      # development
      "cursor"
      "racket"
      "visual-studio-code"
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

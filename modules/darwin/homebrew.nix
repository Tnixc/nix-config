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
    ];

    # `brew install`
    brews = [
      "keith/formulae/reminders-cli"
      "brightness"
      "xcode-build-server"
      "xcbeautify"
      "cliclick"
      "yt-dlp"

      "clang-format"
      "gdb"
      "gcc"
      "opam"
      "node"
      "autoconf"
      "openjdk"
      "aria2"
      "R"
      "gemini-cli"
      "rtk"

      "beast"
      "boost"
      "fmt"
      "re2"
      "nlohmann-json"
      "yaml-cpp"
      "cmark-gfm"
      "tomlplusplus"
    ];

    # `brew install --cask`
    casks = [
      "claude-code"
      "claude"

      "karabiner-elements"
      "alt-tab"
      "hammerspoon"

      "anki"
      "zed"
      "vesktop"
      "parsec"
      "steam"
      "motrix"
      "linearmouse"
      "craft"
      "nordvpn"
      "google-chrome"
      "microsoft-teams"
      "microsoft-word"

      "sf-symbols"

      "font-sf-mono"
      "font-sf-pro"
      "font-maple-mono-nf"
      "font-maple-mono-normal-nf-cn"

      # "flashspace"
      # "loop"
    ];
  };
}

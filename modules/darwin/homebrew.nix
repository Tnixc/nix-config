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
      "thebrowsercompany-dia"
      "arc"
      "chatgpt-atlas"

      "anki"
      "flashspace"
      "karabiner-elements"
      "alt-tab"
      "zed"
      "loop"
      "vesktop"
      "claude-code"
      "hammerspoon"
      "cloudflare-warp"

      "parsec"
      "steam"
      "motrix"
      "nordvpn"
      "linearmouse"
      "reminders-menubar"
      "craft"
      "google-chrome"

      "microsoft-teams"
      "microsoft-word"

      "sf-symbols"

      "font-sf-mono"
      "font-sf-pro"
      "font-maple-mono-nf"
    ];
  };
}

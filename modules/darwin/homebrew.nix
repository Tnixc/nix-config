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

      "clang-format"
      "opam"
      "node"
      "autoconf"
      "openjdk"
      "aria2"
      "R"
    ];

    # `brew install --cask`
    casks = [
      "racket"
      "flashspace"
      "karabiner-elements"

      "orion"
      "parsec"
      "steam"
      "motrix"
      "nordvpn"
      "texshop"
      "leader-key"
      "linearmouse"
      "reminders-menubar"
      "craft"
      "google-chrome"
      "rstudio"

      "sf-symbols"

      "font-sf-mono"
      "font-sf-pro"
    ];
  };
}

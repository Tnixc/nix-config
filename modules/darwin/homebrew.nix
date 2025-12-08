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
    ];

    # `brew install --cask`
    casks = [
      "leader-key"
      "linearmouse"
      "reminders-menubar"
      "orion"

      "parsec"
      "steam"
      "motrix"
      "racket"

      # design and writing
      "craft"
      "google-chrome"

      # fonts
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

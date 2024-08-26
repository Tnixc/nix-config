{ pkgs, ... }:

{
  system = {
    # activationScripts are executed every time you boot the system or run `nixos-rebuild` / `darwin-rebuild`.
    activationScripts.postUserActivation.text = ''
      # activateSettings -u will reload the settings from the database and apply them to the current session,
      # so we do not need to logout and login again to make the changes take effect.
      /System/Library/PrivateFrameworks/SystemAdministration.framework/Resources/activateSettings -u
    '';

    defaults = {
      menuExtraClock.Show24Hour = true; # show 24 hour clock

      dock = {
        autohide = true;
        show-recents = false;
      };

      finder = {
        _FXShowPosixPathInTitle = false; # show full path in finder title
        AppleShowAllExtensions = true; # show all file extensions
        FXEnableExtensionChangeWarning =
          false; # disable warning when changing file extension
        QuitMenuItem = true; # enable quit menu item
        ShowPathbar = true; # show path bar
        ShowStatusBar = false; # show status bar
      };

      trackpad = {
        Clicking = true; # enable tap to click
      };

      NSGlobalDomain = {
        # `defaults read NSGlobalDomain "xxx"`
        "com.apple.swipescrolldirection" =
          true; # enable natural scrolling(default to true)
        "com.apple.sound.beep.feedback" =
          0; # disable beep sound when pressing volume up/down key
        "com.apple.keyboard.fnState" = true; # fn for f1-12
        AppleInterfaceStyle = "Dark"; # dark mode

        ApplePressAndHoldEnabled = true; # enable press and hold

        InitialKeyRepeat =
          15; # normal minimum is 15 (225 ms), maximum is 120 (1800 ms)
        # sets how fast it repeats once it starts.
        KeyRepeat = 2; # normal minimum is 2 (30 ms), maximum is 120 (1800 ms)
      };
    };
  };

  # Add ability to used TouchID for sudo authentication
  security.pam.enableSudoTouchIdAuth = true;

  # Create /etc/zshrc that loads the nix-darwin environment.
  # this is required if you want to use darwin's default shell - zsh
  programs.zsh.enable = true;
}

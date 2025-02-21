# README

## Goal

My goal with this repo is to use Aerospace and Sketchybar together where their configs and versions are interdependent and I want reproducible working setups.  I want the sketchybar setup to be reasonably fast so I want it to use the lua interface instead of the bash madness.  And I want the whole mess to be largely outside of my system files so as not to overly pollute my already complicated setup [there](https://github.com/zmre/nix-config).

## Starting Point

To start with, I'm using the [creator of Sketchybar's dotfiles](https://github.com/FelixKratz/dotfiles/tree/e27673f07ff41eb6a4816daabb79b0a5e837a105/.config/sketchybar), `FelixKratz`, as my config, but he uses yabai and isn't in nix-land, so I'm switching yabai for Aerospace and packaging it all.  The major change to his configs are just the addition of `aerospace.lua` as an alternative to `spaces.lua`.

## Disclaimer

Full disclosure: I have no idea what I'm doing.

I'm learning sketchybar stuff, how to package lua in nix, how to combine these things, and I think I'm doing it all with near zero elegance at this point.  I hope that will evolve as I understand better what's happening.

The current nix packaging is poor.  I just compiled some of the C sub-utilities (like for getting CPU usage) and committed them back to the repo and copy them in, which is the ultimate lazy and awful and single-platform approach.  That needs to change, but also I need to figure out if there's a way to get updates upstream for those in case he fixes bugs in them.

## Using the Setup

Sadly, though I wanted this to be a nice stand-alone flake, it has dependencies that can't be installed via flakes: namely fonts.  You're going to need to install SF Pro and SF Mono and maybe alternately some nerdfonts. I installed the SF fonts via homebrew:

```
      "font-sf-pro"
      "font-sf-mono-for-powerline"
      "font-sf"
      "sf-symbols"
```

That last `sf-symbols` cask is actually a GUI for browsing symbols.  You also need `pkgs.sketchybar-app-font` for the app icons, but I think the dependencies in the flake are good enough.  If you get bogus stuff there, you might need to install that in the system config. If so, let me know so I can update this readme.

At present I tweak and test by cloning this repo and then just locally doing:

`nix run`

That will kill off any running processes and start them back up fresh with new configs. It holds the apps in the foreground and print statements go to the console.  I'll add directions for how to include this from your system config later.

## Home manager

In my system config, I install this flake and then have it launch on startup by adding the below to my home-manager.

```nix
  launchd = {
    # enable by default is true only on darwin
    agents = {
      "com.zmre.aerospace-sketchy" = {
        enable = true;
        config = {
          Label = "com.zmre.aerospace-sketchy";
          ProgramArguments = ["${pkgs.aerospace-sketchy}/bin/pwaerospace"];
          RunAtLoad = true;
          KeepAlive = true;
        };
      };
    };
  };
```

## TODO

### Flake

* [ ] Change build stuff so the sketchybar compiled C files are actually compiled instead of being checked in as binaries
  * 2025-02-13 checked and the helpers haven't been updated in a long time, but for future me:
  * https://github.com/FelixKratz/dotfiles/tree/master/.config/sketchybar/helpers
  * Above repo is what I want to fetch and build from. Problem is, his dotfiles change often but the helpers don't and that's going to create a lot of unnecessary rebuilds.  not a huge deal, but annoying.
  * Alternate idea: would it be idiotic to make my own helpers, but in rust?  Then I could make a weather one, too?

### Sketchybar

* [ ] Moving a workspace to a different screen doesn't trigger any sort of update right now. Maybe the events above?
* [ ] the sketchybar-app-fonts are great for many apps, but I keep finding ones that are missing (eg, Photos, Ghostty, etc) so is there a way for me to use icons from elsewhere if the repo doesn't support something?  
  * Or do I need a fork and to make my own icons?  I've seen PRs that are languishing and will need to see if that continues. Update: I submitted a PR that's languishing
* [ ] When I go to macos full screen, it uses Mac spaces. But I've disabled keys and swipes for getting into/out of those spaces which means I can't navigate to those windows. If the app has only one window that's full screen, cmd-tab works, but if this is Preview, for example, and one PDF is full screen and another isn't, I might have a hard time getting to the full screen one. Should I disable full screen app options outside of what aerospace does?  Or bring back a way to access them?

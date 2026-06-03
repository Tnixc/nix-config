{
  theme,
  config,
  ...
}: let
  c = theme.colors;
in {
  xdg.configFile."ghostty/config".text = ''
    # Font
    font-family = BerkeleyMono Nerd Font
    font-size = 14

    # Shell
    command = /etc/profiles/per-user/${config.home.username}/bin/fish

    # Window
    background-opacity = 0.95
    background-blur-radius = 24
    window-padding-x = 0
    window-padding-y = 0
    macos-titlebar-style = tabs
    macos-option-as-alt = true

    # Cursor
    cursor-style = bar

    # Scrollback
    scrollback-limit = 10000

    # Shell integration
    shell-integration = fish

    # Theme colors
    background = ${c.base}
    foreground = ${c.text}
    selection-background = ${c.surface2}
    cursor-color = ${c.rosewater}
    cursor-text = ${c.crust}

    url-color = ${c.rosewater}

    palette = 0=${c.surface1}
    palette = 8=${c.surface2}

    palette = 1=${c.red}
    palette = 9=${c.red}

    palette = 2=${c.green}
    palette = 10=${c.green}

    palette = 3=${c.yellow}
    palette = 11=${c.yellow}

    palette = 4=${c.blue}
    palette = 12=${c.blue}

    palette = 5=${c.pink}
    palette = 13=${c.pink}

    palette = 6=${c.sapphire}
    palette = 14=${c.sapphire}

    palette = 7=${c.subtext1}
    palette = 15=${c.subtext0}

    # Keybindings
    key = super+t=new_tab
    key = super+w=close_tab
    key = super+1=goto_tab:1
    key = super+2=goto_tab:2
    key = super+3=goto_tab:3
    key = super+4=goto_tab:4
    key = super+5=goto_tab:5
    key = super+6=goto_tab:6
    key = super+7=goto_tab:7
    key = super+8=goto_tab:8
    key = super+9=goto_tab:9
    key = ctrl+tab=next_tab
    key = ctrl+shift+tab=previous_tab

    key = super+shift+w=close_tab

    key = super+up=previous_tab
    key = super+down=next_tab
    key = super+shift+n=new_tab
  '';
}

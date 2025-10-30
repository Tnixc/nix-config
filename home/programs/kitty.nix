{...}: let
  theme = import ../theme.nix;
  c = theme.colors;
in {
  programs.kitty = {
    enable = true;

    font = {
      name = "BerkeleyMono Nerd Font";
      size = 14;
    };

    settings = {
      url_style = "straight";

      shell_integration = "enabled";
      scrollback_lines = 10000;

      inactive_tab_font_style = "normal";
      active_tab_font_style = "bold";

      tab_bar_edge = "bottom";
      tab_bar_align = "left";
      tab_bar_style = "powerline";
      tab_powerline_style = "slanted";
      tab_bar_min_tabs = 2;
      tab_activity_symbol = "none";
      tab_separator = "\"\"";
      bell_on_tab = false;

      tab_title_template = "{fmt.bold}{tab.active_exe.replace('-zsh', 'zsh').replace('starship', 'zsh')}{fmt.nobold} {(lambda wd: wd[:5] + '...' + wd[-21:] if len(wd) > 30 else wd)(tab.active_wd.replace('/Users/tnixc/Developer', '~/ ').replace('/Users/tnixc', '~'))}";

      window_padding_width = 2;
      window_padding_height = 0;

      hide_window_decorations = "titlebar-only";

      cursor_shape = "underline";

      editor = "/opt/homebrew/bin/nvim";
      shell = "/etc/profiles/per-user/tnixc/bin/fish";

      macos_option_as_alt = true;
      macos_colorspace = "displayp3";

      paste_actions = "quote-urls-at-prompt,confirm-if-large";

      allow_remote_control = true;

      # edo theme colors
      foreground = c.text;
      background = c.base;
      selection_foreground = "none";
      selection_background = c.surface2;

      cursor = c.rosewater;
      cursor_text_color = c.crust;

      url_color = c.rosewater;

      active_border_color = c.lavender;
      inactive_border_color = "#6c7086";
      bell_border_color = c.yellow;

      wayland_titlebar_color = "system";
      macos_titlebar_color = "system";

      active_tab_foreground = "#11111b";
      active_tab_background = c.blue;
      inactive_tab_foreground = c.text;
      inactive_tab_background = c.base;
      tab_bar_background = c.crust;

      background_opacity = "0.95";
      background_blur = 24;

      mark1_foreground = c.crust;
      mark1_background = c.lavender;

      mark2_foreground = c.crust;
      mark2_background = c.mauve;

      mark3_foreground = c.crust;
      mark3_background = c.sky;

      # Terminal colors
      color0 = c.surface1;
      color8 = c.surface2;

      color1 = c.red;
      color9 = c.red;

      color2 = c.green;
      color10 = c.green;

      color3 = c.yellow;
      color11 = c.yellow;

      color4 = c.blue;
      color12 = c.blue;

      color5 = c.pink;
      color13 = c.pink;

      color6 = c.teal;
      color14 = c.teal;

      color7 = c.subtext1;
      color15 = c.subtext0;

      disable_ligatures = "always";
    };

    keybindings = {
      "cmd+click" = "open_url";
      "cmd+1" = "goto_tab 1";
      "cmd+2" = "goto_tab 2";
      "cmd+3" = "goto_tab 3";
      "cmd+4" = "goto_tab 4";
      "cmd+5" = "goto_tab 5";
      "cmd+6" = "goto_tab 6";
      "cmd+7" = "goto_tab 7";
      "cmd+8" = "goto_tab 8";
      "cmd+9" = "goto_tab 9";
      "cmd+f" = "launch --type=overlay --stdin-source=@screen_scrollback /bin/sh -c '/run/current-system/sw/bin/fzf --no-sort --no-mouse --exact -i --tac | tr -d \"\\n\" | kitty +kitten clipboard'";
      "alt+f" = "launch --stdin-source=@screen_scrollback --stdin-add-formatting --copy-colors --type=tab --title=\"scrollback search\" /opt/homebrew/bin/nvim";
    };

    extraConfig = ''
      modify_font underline_thickness 100%
      modify_font underline_position 3
      modify_font baseline 0.5
      modify_font cell_height 152%

      mouse_map cmd+click open_url
    '';
  };
}

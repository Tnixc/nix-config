{...}: {
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
      foreground = "#D8D6C9";
      background = "#121212";
      selection_foreground = "none";
      selection_background = "#333333";

      cursor = "#C97D6E";
      cursor_text_color = "#000000";

      url_color = "#C97D6E";

      active_border_color = "#4C8E72";
      inactive_border_color = "#6c7086";
      bell_border_color = "#CC9B70";

      wayland_titlebar_color = "system";
      macos_titlebar_color = "system";

      active_tab_foreground = "#11111b";
      active_tab_background = "#687eaa";
      inactive_tab_foreground = "#D8D6C9";
      inactive_tab_background = "#121212";
      tab_bar_background = "#000000";

      background_opacity = "0.95";
      background_blur = 24;

      mark1_foreground = "#000000";
      mark1_background = "#4C8E72";

      mark2_foreground = "#000000";
      mark2_background = "#6872AB";

      mark3_foreground = "#000000";
      mark3_background = "#5D9AA9";

      # Terminal colors
      color0 = "#232323";
      color8 = "#333333";

      color1 = "#CB7676";
      color9 = "#CB7676";

      color2 = "#80A665";
      color10 = "#80A665";

      color3 = "#CC9B70";
      color11 = "#CC9B70";

      color4 = "#687eaa";
      color12 = "#687eaa";

      color5 = "#BC76C1";
      color13 = "#BC76C1";

      color6 = "#5EA994";
      color14 = "#5EA994";

      color7 = "#B2B0A6";
      color15 = "#999895";

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

{
  theme,
  config,
  ...
}: let
  c = theme.colors;
in {
  xdg.configFile."kitty/tab_bar.py".source = ./tab_bar.py;
  xdg.configFile."kitty/kitty.app.png".source = ../../../../../modules/icons/kitty.png;

  xdg.configFile."kitty/kitty.conf".text = ''
    font_family BerkeleyMono Nerd Font
    font_size 14

    url_style straight
    shell_integration enabled
    scrollback_lines 10000

    inactive_tab_font_style normal
    active_tab_font_style bold

    tab_bar_edge top
    tab_bar_align left
    tab_bar_style custom
    tab_bar_min_tabs 2
    tab_activity_symbol none
    tab_separator ""
    bell_on_tab no

    tab_title_template {fmt.bold}{tab.active_exe.replace('-zsh', 'zsh').replace('starship', 'zsh')}{fmt.nobold} {(lambda wd: wd[:5] + '...' + wd[-21:] if len(wd) > 30 else wd)(tab.active_wd.replace('${config.home.homeDirectory}/Developer', '~/􀙅 ').replace('${config.home.homeDirectory}', '~'))}

    window_padding_width 4
    window_padding_height 4

    hide_window_decorations titlebar-only

    cursor_shape underline

    shell /etc/profiles/per-user/${config.home.username}/bin/fish

    macos_option_as_alt yes
    macos_colorspace displayp3

    paste_actions quote-urls-at-prompt,confirm-if-large

    allow_remote_control yes

    foreground ${c.text}
    background ${c.base}
    selection_foreground none
    selection_background ${c.surface2}

    cursor ${c.rosewater}
    cursor_text_color ${c.crust}

    url_color ${c.rosewater}

    active_border_color ${c.lavender}
    inactive_border_color ${c.overlay1}
    bell_border_color ${c.yellow}

    wayland_titlebar_color system
    macos_titlebar_color system

    active_tab_foreground ${c.text}
    active_tab_background ${c.base}
    inactive_tab_foreground ${c.subtext0}
    inactive_tab_background ${c.crust}
    tab_bar_background ${c.base}

    background_opacity 0.95
    background_blur 24

    mark1_foreground ${c.crust}
    mark1_background ${c.lavender}

    mark2_foreground ${c.crust}
    mark2_background ${c.mauve}

    mark3_foreground ${c.crust}
    mark3_background ${c.sky}

    color0 ${c.surface1}
    color8 ${c.surface2}

    color1 ${c.red}
    color9 ${c.red}

    color2 ${c.green}
    color10 ${c.green}

    color3 ${c.yellow}
    color11 ${c.yellow}

    color4 ${c.blue}
    color12 ${c.blue}

    color5 ${c.pink}
    color13 ${c.pink}

    color6 ${c.teal}
    color14 ${c.teal}

    color7 ${c.subtext1}
    color15 ${c.subtext0}

    disable_ligatures always

    modify_font underline_thickness 100%
    modify_font underline_position 3
    modify_font baseline 0.5
    modify_font cell_height 172%

    map cmd+1 goto_tab 1
    map cmd+2 goto_tab 2
    map cmd+3 goto_tab 3
    map cmd+4 goto_tab 4
    map cmd+5 goto_tab 5
    map cmd+6 goto_tab 6
    map cmd+7 goto_tab 7
    map cmd+8 goto_tab 8
    map cmd+9 goto_tab 9
    map cmd+f launch --type=overlay --stdin-source=@screen_scrollback /bin/sh -c '/run/current-system/sw/bin/fzf --no-sort --no-mouse --exact -i --tac | tr -d "\n" | kitty +kitten clipboard'
    map alt+f launch --stdin-source=@screen_scrollback --stdin-add-formatting --copy-colors --type=tab --title="scrollback search" /opt/homebrew/bin/nvim

    mouse_map cmd+click open_url
  '';
}

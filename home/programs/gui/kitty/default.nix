{
  theme,
  config,
  ...
}: let
  c = theme.colors;
in {
  xdg.configFile."kitty/kitty.conf".text = ''
    font_family BerkeleyMono Nerd Font
    font_size 14

    url_style straight
    shell_integration enabled
    scrollback_lines 10000

    window_padding_width 0
    window_padding_height 0

    hide_window_decorations titlebar-only

    cursor_shape underline

    shell /etc/profiles/per-user/${config.home.username}/bin/tmux

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

    color6 ${c.sapphire}
    color14 ${c.sapphire}

    color7 ${c.subtext1}
    color15 ${c.subtext0}

    disable_ligatures always

    modify_font underline_thickness 100%
    modify_font underline_position 3
    modify_font baseline 0.5
    modify_font cell_height 172%

    # Tmux window (tab) management
    map cmd+t launch --type=background /etc/profiles/per-user/${config.home.username}/bin/tmux new-window -c "#{pane_current_path}"
    map cmd+w launch --type=background /etc/profiles/per-user/${config.home.username}/bin/tmux kill-pane
    map cmd+1 launch --type=background /etc/profiles/per-user/${config.home.username}/bin/tmux select-window -t :1
    map cmd+2 launch --type=background /etc/profiles/per-user/${config.home.username}/bin/tmux select-window -t :2
    map cmd+3 launch --type=background /etc/profiles/per-user/${config.home.username}/bin/tmux select-window -t :3
    map cmd+4 launch --type=background /etc/profiles/per-user/${config.home.username}/bin/tmux select-window -t :4
    map cmd+5 launch --type=background /etc/profiles/per-user/${config.home.username}/bin/tmux select-window -t :5
    map cmd+6 launch --type=background /etc/profiles/per-user/${config.home.username}/bin/tmux select-window -t :6
    map cmd+7 launch --type=background /etc/profiles/per-user/${config.home.username}/bin/tmux select-window -t :7
    map cmd+8 launch --type=background /etc/profiles/per-user/${config.home.username}/bin/tmux select-window -t :8
    map cmd+9 launch --type=background /etc/profiles/per-user/${config.home.username}/bin/tmux select-window -t :9
    map ctrl+tab launch --type=background /etc/profiles/per-user/${config.home.username}/bin/tmux next-window
    map ctrl+shift+tab launch --type=background /etc/profiles/per-user/${config.home.username}/bin/tmux previous-window

    # Kitty window management
    map cmd+shift+w close_window

    # Tmux session management
    map cmd+/ launch --type=background /etc/profiles/per-user/${config.home.username}/bin/tmux display-popup -E -w "80%" -h "80%" tmux-session-picker
    map cmd+up launch --type=background /etc/profiles/per-user/${config.home.username}/bin/tmux switch-client -p
    map cmd+down launch --type=background /etc/profiles/per-user/${config.home.username}/bin/tmux switch-client -n
    map cmd+shift+n launch --type=background /etc/profiles/per-user/${config.home.username}/bin/tmux new-session -dP

    map cmd+f launch --type=overlay --stdin-source=@screen_scrollback /bin/sh -c '/run/current-system/sw/bin/fzf --no-sort --no-mouse --exact -i --tac | tr -d "\n" | kitty +kitten clipboard'
  '';
}

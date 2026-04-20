# home.nix
{paneru, ...}: {
  imports = [
    paneru.homeModules.paneru
  ];

  services.paneru = {
    enable = false;
    # Equivalent to what you would put into `~/.paneru` (See Configuration options below).
    settings = {
      options = {
        preset_column_widths = [0.3 0.5 0.7 0.9 1];
        animation_speed = 140;
        focus_follows_mouse = true;
        mouse_follows_focus = false;
      };
      swipe = {
        continuous = false;
        deceleration = 10.0;
        sensitivity = 1.0;
        gesture = {
          fingers_count = 3;
        };
      };
      padding = {
        top = 10;
        bottom = 10;
        left = 10;
        right = 10;
      };
      bindings = {
        window_focus_west = "cmd + alt + ctrl - q";
        window_focus_east = "cmd + alt + ctrl - e";
        window_focus_north = "cmd + alt + ctrl - k";
        window_focus_south = "cmd + alt + ctrl - j";
        window_swap_west = "cmd + alt + ctrl - right";
        window_swap_east = "cmd + alt + ctrl - left";
        # window_swap_first = "alt + ctrl + shift - h";
        # window_swap_last = "alt + ctrl + shift - l";
        window_center = "alt  - c";
        window_resize = "alt - r";
        window_fullwidth = "alt - f";
        window_manage = "alt - t";
        window_stack = "alt - [";
        window_unstack = "alt  - [";
        window_nextdisplay = "cmd + alt + ctrl - a";
        quit = "ctrl + alt - q";
      };
    };
  };
}

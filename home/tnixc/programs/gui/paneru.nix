# home.nix
{paneru, ...}: {
  imports = [
    paneru.homeModules.paneru
  ];

  services.paneru = {
    enable = true;
    # Equivalent to what you would put into `~/.paneru` (See Configuration options below).
    settings = {
      options = {
        preset_column_widths = [ 0.2 0.5 0.75 1];
        continuous_swipe = true;
        swipe_gesture_fingers = 3;
        animation_speed = 30;
        focus_follows_mouse = false;
        mouse_follows_focus = false;
      };
      bindings = {
        window_focus_west = "cmd + alt + ctrl - h";
        window_focus_east = "cmd + alt + ctrl - l";
        window_focus_north = "cmd + alt + ctrl - k";
        window_focus_south = "cmd + alt + ctrl - j";
        window_swap_west = "alt + shift - h";
        window_swap_east = "alt + shift - l";
        window_swap_first = "alt + ctrl + shift - h";
        window_swap_last = "alt + ctrl + shift - l";
        window_center = "alt + shift - c";
        window_resize = "alt + shift - r";
        window_fullwidth = "alt + shift - f";
        window_manage = "ctrl + alt - t";
        window_stack = "alt - ]";
        window_unstack = "alt + shift - ]";
        window_nextdisplay = "alt - n";
        quit = "ctrl + alt - q";
      };
    };
  };
}

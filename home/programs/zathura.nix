{...}: let
  theme = import ../theme.nix;
  c = theme.colors;
in {
  programs.zathura = {
    enable = true;

    options = {
      selection-clipboard = "clipboard";
      guioptions = "none";
      scroll-step = 1;
      scroll-hstep = 1;
      zoom-step = 1;
      smooth-scroll = true;
      window-title-basename = "true";

      statusbar-basename = "true";
      statusbar-home-tilde = "true";
      statusbar-h-padding = "5";
      statusbar-v-padding = "5";

      incremental-search = "true";
      adjust-open = "best-fit";

      save_position = "true";
      font = "BerkeleyMono Nerd Font normal 20";

      recolor = true;
      recolor-keephue = true;
      recolor-darkcolor = c.text;
      recolor-lightcolor = c.crust;

      default-fg = "rgba(200,200,200,1)";
      default-bg = "rgba(10,10,10,1)";
      completion-bg = "rgba(40,40,40,1)";
      completion-fg = "rgba(200,200,200,1)";
      completion-highlight-bg = "rgba(180,180,180,1)";
      completion-highlight-fg = "rgba(30,30,30,1)";
      completion-group-bg = "rgba(25,25,25,1)";
      completion-group-fg = "rgba(200,200,200,1)";
      statusbar-fg = "rgba(200,200,200,1)";
      statusbar-bg = "rgba(20,20,20,1)";
      inputbar-fg = "rgba(200,200,200,1)";
      inputbar-bg = "rgba(30,30,30,1)";
      notification-bg = "rgba(30,30,30,1)";
      notification-fg = "rgba(200,200,200,1)";
      notification-error-bg = "rgba(30,30,30,1)";
      notification-error-fg = "rgba(160,160,160,1)";
      notification-warning-bg = "rgba(30,30,30,1)";
      notification-warning-fg = "rgba(220,220,220,1)";
      index-fg = "rgba(200,200,200,1)";
      index-bg = "rgba(30,30,30,1)";
      index-active-fg = "rgba(200,200,200,1)";
      index-active-bg = "rgba(50,50,50,1)";
      render-loading-bg = "rgba(30,30,30,1)";
      render-loading-fg = "rgba(200,200,200,1)";
      highlight-color = "rgba(150,150,150,0.3)";
      highlight-fg = "rgba(200,200,200,1)";
      highlight-active-color = "rgba(180,180,180,0.3)";
    };

    mappings = {
      b = "adjust_window best-fit";
    };
  };
}

{pkgs, ...}: {
  programs.zsh = {
    enable = true;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;
    initExtra = ''
      gc() {
        git commit -m "$1"
      }
    '';
  };

  home.shellAliases = {
    a = "nvim";
    q = "exit";

    g = "git";
    ga = "git add -A";
    lz = "lazygit";

    ls = "eza --icons";
    l = "eza --icons -la";
    la = "eza --icons -a";
    ll = "eza --icons -l";
    tree = "eza --icons --tree -a";

  };
}

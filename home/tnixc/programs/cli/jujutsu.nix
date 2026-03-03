{theme, ...}: let
  c = theme.colors;
  d = theme.diff;
in {
  programs.jujutsu = {
    enable = true;
    settings = {
      user = {
        name = "Tnixc";
        email = "tnixxc@gmail.com";
      };
      signing = {
        backend = "gpg";
        sign-all = true;
      };

      # core.fsmonitor = "watchman";
      fsmonitor.backend = "watchman";
      snapshot.max-new-file-size = "10MiB";
    };
  };
}

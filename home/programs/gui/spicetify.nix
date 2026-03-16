{
  spicetify-nix,
  pkgs,
  ...
}: let
  spicePkgs = spicetify-nix.legacyPackages.${pkgs.stdenv.system};
in {
  imports = [spicetify-nix.homeManagerModules.spicetify];

  programs.spicetify = {
    enable = true;
    alwaysEnableDevTools = true;

    enabledExtensions = with spicePkgs.extensions; [
      adblockify
      hidePodcasts
      shuffle # shuffle+ (special characters are sanitized out of extension names)
      fullScreen
      coverAmbience
      beautifulLyrics
      fullAlbumDate
      showQueueDuration
      history
      volumePercentage
      playNext
    ];

    theme = {
      # Name of the theme (duh)
      name = "evergarden";
      # The source of the theme
      # make sure you're using the correct branch
      # It could also be a sub-directory of the repo
      src = "${pkgs.fetchFromGitHub {
        owner = "everviolet";
        repo = "spicetify";
        rev = "d37d8ce00ba544f95d42e92eb8c4c23048d39720";
        hash = "sha256-mjsCNGXOUT9dVfgyGHQ8P3zwwWyyYHqT/66xhOgdNG0=";
      }}/evergarden";

      # Additional theme options all set to defaults
      # the docs of the theme should say which of these
      # if any you have to change
      injectCss = true;
      injectThemeJs = true;
      replaceColors = true;
      homeConfig = true;
      overwriteAssets = true;
      additionalCss = ''
        * { font-family: "Maple Mono NF", "Test Söhne", "Aktiv Grotesk", system-ui, sans-serif !important; }
      '';
    };

    colorScheme = "winter";
  };
}

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
    ];

    theme =
      spicePkgs.themes.ziro
      // {
        additionalCss = ''
          :root {
              --encore-title-font-stack: "Maple Mono NF", "Test Söhne", "Aktiv Grotesk", system-ui, sans-serif !important;
              --encore-body-font-stack: "Maple Mono NF", "Test Söhne", "Aktiv Grotesk", system-ui, sans-serif !important;
          }
        '';
      };

    colorScheme = "green-dark";
  };
}

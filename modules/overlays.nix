{
  pkgs,
  rust-overlay,
  ...
}: {
  nixpkgs.overlays = [
    rust-overlay.overlays.default
    # fish
    (final: prev: {
      fish = prev.fish.overrideAttrs (oldAttrs: {
        doCheck = false;
      });
    })
  ];
}



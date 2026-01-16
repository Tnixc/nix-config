{...}: {
  imports = [
    ./environment
    ./homebrew.nix
    ./nix.nix
    ./packages.nix
    ./preferences
    ./security
    ./services/transmission.nix
    ./system.nix
  ];
}

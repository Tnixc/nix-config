deploy:
    nom build .#darwinConfigurations.End.system
    sudo ./result/activate

build:
    nom build .#darwinConfigurations.End.system

fmt:
    nix fmt .
    stylua . --sort-requires --indent-type spaces --indent-width 4

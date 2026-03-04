deploy:
    nom build ".#darwinConfigurations.$(hostname -s).system"
    sudo ./result/activate

build:
    nom build ".#darwinConfigurations.$(hostname -s).system"

fmt:
    nix fmt .
    stylua . --sort-requires --indent-type spaces --indent-width 4

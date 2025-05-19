deploy:
	nom build .#darwinConfigurations.End.system
	sudo ./result/activate

fmt:
    nix fmt .
    stylua . --sort-requires

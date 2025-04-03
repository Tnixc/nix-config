deploy:
	nom build .#darwinConfigurations.End.system

	./result/activate-user
	sudo ./result/activate

fmt:
    nix fmt
    stylua . --sort-requires

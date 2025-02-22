deploy:
	nix build .#darwinConfigurations.End.system

	./result/activate-user
	sudo ./result/activate

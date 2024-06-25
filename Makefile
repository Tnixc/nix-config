deploy:
	nix build .#darwinConfigurations.End.system \
	   --extra-experimental-features 'nix-command flakes'

	./result/sw/bin/darwin-rebuild switch --flake .#End
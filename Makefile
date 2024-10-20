deploy:
	nix run github:Mic92/nix-fast-build -- --systems 'aarch64-darwin' --no-nom --eval-max-memory-size 12000 --flake '.#darwinConfigurations.End.system'

	./result-/activate-user
	sudo ./result-/activate

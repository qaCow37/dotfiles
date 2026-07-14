{
	imports = [
		./programs
		./services
		./xdg
		./catppuccin.nix
		./home.nix
	];
	nixpkgs.config.allowUnfree = true;
}

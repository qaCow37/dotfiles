{
	imports = [
		./catppuccin.nix

		./settings.nix
	];
	programs.starship = {
		enable = true;
		enableFishIntegration = true;
	};
}

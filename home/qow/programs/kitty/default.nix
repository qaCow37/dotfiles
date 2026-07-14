{
	imports = [
		./catppuccin.nix

		./extraConfig
	];
	programs.kitty = {
		enable = true;
	};
}

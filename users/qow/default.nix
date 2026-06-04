{config, pkgs, inputs, ...}:
{
	home = {
		stateVersion = "26.05";
		username = "qow";
		homeDirectory = "/home/qow";
	};

	imports = [
		./hyprland.nix
		./zen-browser.nix
	];
}

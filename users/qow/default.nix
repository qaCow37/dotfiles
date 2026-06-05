{config, pkgs, inputs, ...}:
{
	nixpkgs.config.allowUnfree = true;
	
	home = {
		stateVersion = "26.05";
		username = "qow";
		homeDirectory = "/home/qow";
	};

	programs.vesktop.enable = true;

	home.packages = with pkgs; [
#		thcrap-steam-proton-wrapper
		gamescope
	];

	imports = [
		./hyprland.nix
		./zen-browser.nix
		./spicetify.nix
		./kitty.nix
	];
}

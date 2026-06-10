{config, pkgs, inputs, ...}:
{
	nixpkgs.config.allowUnfree = true;
	
	home = {
		stateVersion = "26.05";
		username = "qow";
		homeDirectory = "/home/qow";
	};
	
	#services.udiskie = {
	#	enable = true;
	#	notify = false;
	#};

	programs.vesktop.enable = true;

	home.packages = with pkgs; [
		# move into own apps or some shi
		modrinth-app
		gamescope
		mangohud
		krita
	];

	imports = [
		./desktop.nix
		./shell.nix
		./apps
	];
}

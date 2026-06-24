{pkgs, ...}:
{
	nixpkgs.config.allowUnfree = true;
	
	home = {
		stateVersion = "26.05";
		username = "qow";
		homeDirectory = "/home/qow";
	};
	
	xdg.userDirs = {
		enable = true;
		createDirectories = true;
		desktop     = "$HOME/assets/desktop";
		music       = "$HOME/assets/music";
		videos      = "$HOME/assets/videos";
		pictures    = "$HOME/assets/pictures";
		projects    = "$HOME/assets/projects";
		documents   = "$HOME/assets/documents";
		templates   = "$HOME/assets/templates";
		publicShare = "$HOME/assets/public-share";
		download    = "$HOME/downloads";
	};

	home.packages = with pkgs; [
		#modrinth-app
		gamescope
		mangohud
		krita
		xwayland-satellite
	];

	imports = [
		./catppuccin.nix
		./desktop.nix
		./shell.nix
		./devenv.nix
		./apps
	];
}

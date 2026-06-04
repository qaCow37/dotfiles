{config, pkgs, inputs, ...}:
{
	home = {
		packages = with pkgs; [flatpak];
		stateVersion = "26.05";
		username = "qow";
		homeDirectory = "/home/qow";
	};
	
	services.flatpak = {
		enable = true;
		packages = [
			"com.spotify.Client"
			"com.discordapp.Discord"
			"app.zen_browser.zen"
		];
		update.onActivation = true;
	};

	imports = [
		./hyprland.nix
	];
}

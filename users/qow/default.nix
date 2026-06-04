{config, pkgs, inputs, ...}:
{
	home.packages = with pkgs; [flatpak];
	
	services.flatpak = {
		enable = true;
		packages = [
			"com.spotify.Client"
			"com.discordapp.Discord"
			"app.zen_browser.zen"
			"io.github.shiftey.Desktop"
		];
		update.onActivation = true;
	};

	system.stateVersion = "26.05";
}

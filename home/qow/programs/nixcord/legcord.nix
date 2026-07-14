{pkgs, ...}:
{
	programs.nixcord.legcord = {
		enable = true;
		package = pkgs.legcord.override {
			# pnpm_10_29_2 is insecure
			# swap it with secure alternative
			pnpm_10_29_2 = pkgs.pnpm_10;
		};
		settings = {
			channel = "stable";
			doneSetup = true;
			mods = [];
			hardwareAcceleration = true;
			minimizeToTray = false;
			tray = "none";
		};
	};
}

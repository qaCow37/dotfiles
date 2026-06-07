{config, pkgs, assets-path, config-path, ...}:
{
	wayland.windowManager.hyprland = {
		enable = true;
		# nixos system has already Hyprland installed
		package = null;
		
		configType = "lua";
		extraConfig = ''
			local monitors = require("monitors")
			local audio    = require("audio")
			local keybinds = require("keybinds")
			local layout   = require("layout")
			-- FixMe replace this with real configs!
			require("tmp")

			monitors.conf()
			audio   .conf()
			keybinds.conf()
			layout  .conf()
		'';
	};
	services.hyprpaper = {
		enable = true;
		settings = 
		let
			wallpaper = "${assets-path}/background.png";
			black     = "${assets-path}/black.png";
		in
		{
			preload = [wallpaper black];
			wallpaper = [
				{
					monitor = "DP-1";
					path = wallpaper;
					fit_mode = "cover";
				}
				{
					monitor = "DP-2";
					path = black;
					fit_mode = "cover";
				}
				{
					monitor = "DP-3";
					path = black;
					fit_mode = "cover";
				}
			];
			splash = false;
		};
	};
	xdg.configFile.hypr = {
		source = "${config-path}/hypr";
		recursive = true;
		force = true;
	};
}

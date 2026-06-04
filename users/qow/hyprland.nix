{config, pkgs, flakeRoot, ...}:
{
	wayland.windowManager.hyprland = {
		enable = true;
		configType = "lua";

		extraConfig = ''
			local monitors = require("monitors")
			-- FixMe replace this with real configs!
			require("tmp")

			monitors.conf()
		'';
	};
	xdg.configFile.hypr = {
		source = "${flakeRoot}/config/hypr";
		recursive = true;
	};
}

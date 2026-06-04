{config, pkgs, flakeRoot, ...}:
{
	wayland.windowManager.hyprland = {
		enable = true;
		configType = "lua";

		extraConfig = ''
			local monitors = require("monitors")
			local keybinds = require("keybinds")
			-- FixMe replace this with real configs!
			require("tmp")

			monitors.conf()
			keybinds.conf()
		'';
	};
	xdg.configFile.hypr = {
		source = "${flakeRoot}/config/hypr";
		recursive = true;
		force = true;
	};
}

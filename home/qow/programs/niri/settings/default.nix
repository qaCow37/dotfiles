{
	imports = [
		./binds.nix
		./layout.nix
		./outputs.nix
		./xwayland-satellite.nix
	];
	programs.niri.settings = {
		prefer-no-csd = true;

		input.keyboard = {
			repeat-delay = 150;
			repeat-rate = 50;
		};
		gestures.hot-corners.enable = false;
		hotkey-overlay.skip-at-startup = true;
		recent-windows.enable = false;

		cursor = {
			size = 16;
			theme = "Bibata-Modern-Classic";
			hide-when-typing = true;
			hide-after-inactive-ms = 3000;
		};

		blur = {
			passes = 5;
			offset = 8;
			noise = 0.02;
			saturation = 1.0;
		};

		layer-rules = [
			{
				matches = [{namespace = "wpaperd.*";}];
				place-within-backdrop = true;
			}
		];
		window-rules = [
			{
				background-effect = {
					blur = true;
					xray = false;
				};
				geometry-corner-radius = let v = 20.0; in
				{
					bottom-left  = v;
					bottom-right = v;
					top-left     = v;
					top-right    = v;
				};
				clip-to-geometry = true;
			}
		];
	};
}

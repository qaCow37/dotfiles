{flake, ...}:
{
	services.wpaperd =
	let
		wallpaper = {
			path = "${flake}/assets/background.png";
			mode = "center";
		};
	in
	{
		enable = true;
		settings = {
			"DP-1" = wallpaper;
			"eDP-1" = wallpaper;
		};
	};
}

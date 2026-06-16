{pkgs, ...}:
{
	programs.niri = {
		enable = true;
		package = pkgs.niri;
	};
	
	# Maybe i will switch to hyprland again
	programs.hyprland = {
		enable = true;
		xwayland.enable = false;
		withUWSM = true;
	};

	services.displayManager.ly = {
		enable = true;
		settings = {
			clock = "%c";
		};
	};
	# ensure that ly renders correctly only on primary monitor
	boot.kernelParams = ["video=2560x1440"];
}

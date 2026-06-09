{config, pkgs, ...}:
{
	programs.niri = {
		enable = true;
		package = pkgs.niri;
	};
	#programs.uwsm = {
	#	enable = true;
	#	waylandCompositors = {
	#		niri = {
	#			prettyName = "Niri";
	#			comment = "Scrollable-tiling Wayland compositor";
	#			binPath = "${config.programs.niri.package}/bin/niri-session";
	#		};
	#	};
	#};
	#systemd.user.services.niri.enable = false;

	services.displayManager.ly = {
		enable = true;
		settings = {
			clock = "%c";
		};
	};
}

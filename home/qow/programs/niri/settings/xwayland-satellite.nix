{lib, pkgs, ...}:
{
	programs.niri.settings.xwayland-satellite = {
		enable = true;
		path = lib.getExe pkgs.xwayland-satellite;
	};
}

{lib, pkgs, ...}:
{
	# Definitly need a desktop portal
	# at some point, BUT NOT GTK!

	xdg.portal = {
		enable = lib.mkForce false;

		# # mkForce because we dont want to install
		# # Gnome Portal because of Niri-Flake
		# extraPortals = lib.mkForce (with pkgs; [
		# 	xdg-desktop-portal-wlr
		# ]);
		#
		# config = {
		# 	common = {
		# 	    "org.freedesktop.impl.portal.ScreenCast" = [ "wlr" ];
		# 	    "org.freedesktop.impl.portal.Screenshot" = [ "wlr" ];
		# 	};
		# };
	};
}

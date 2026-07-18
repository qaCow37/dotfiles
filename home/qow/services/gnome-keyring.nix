{lib, ...}:
{
	services.gnome-keyring = {
		# niri fucking installs gnome shit!
		enable = lib.mkForce false;
	};
}

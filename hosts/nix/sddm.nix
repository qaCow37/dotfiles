{config, pkgs, ...}:
let
	hyprland-config = ''
		animations = {
			enabled = false
		}
		xwayland {
			force_zero_scaling = true
		}

		# only show sddm login screen on primary monitor
		monitor = DP-1, 2560x1440@240, 0x0, 1
		monitor = DP-2, disable
		monitor = DP-3, disable
	'';
in
{
	programs.hyprland = {
		enable = true;
		withUWSM = true;
	};
	services.displayManager.sddm = {
		enable = true;
		wayland.enable = true;
		settings = {
			Wayland = {
				CompositorCommand = "${config.programs.hyprland.package}/bin/start-hyprland";
			};
		};
	};

	# copy the hyprland config to sddm
	systemd.tmpfiles.rules = [
		"d /var/lib/sddm/.config/hypr 0755 sddm sddm -"
		"L+ /var/lib/sddm/.config/hypr/hyprland.conf - - - - ${pkgs.writeText "hyprland.conf" hyprland-config}"
	];
}

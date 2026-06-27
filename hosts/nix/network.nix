{config, lib, pkgs, ...}:{
	options.option = {
		network_wireless = lib.mkOption {
			type = lib.types.bool;
			default = false;
		};
	};
	config = {
		networking = {
			networkmanager = {
				enable = config.option.network_wireless;
			};
			useDHCP = false;
		};

		# NetworkD for LAN, network manager for WLAN
		systemd.network = {
			enable = !config.option.network_wireless;

			networks."10-lan" = {
				matchConfig = {Name = "en*";};
				networkConfig = {
					DHCP = true;
					IPv6AcceptRA = true;
					DNS = ["9.9.9.9" "2620:fe::fe"];
				};
				ipv6AcceptRAConfig = {
					UseDomains = false;
					UseDNS = false;
				};
			};
		};
		services.resolved.enable = true;
	};
}

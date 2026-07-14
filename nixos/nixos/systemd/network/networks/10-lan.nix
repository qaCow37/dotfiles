{
	systemd.network.networks."10-lan" = {
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
}

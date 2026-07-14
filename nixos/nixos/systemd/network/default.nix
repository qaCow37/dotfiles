{
	imports = [
		./networks
	];
	systemd.network = {
		enable = true;
	};
}

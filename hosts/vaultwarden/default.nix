{...}:{
	imports = [
		./boot.nix
	];

	services.openssh = {
		enable = true;
		settings = {
			PermitRootLogin = "yes";
		};
	};
}

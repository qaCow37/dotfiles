{config, lib, pkgs, ...}:{
	options.option = {
		users = lib.mkOption {
			type = lib.types.bool;
			default = true;
		};
	};
	config.users = lib.mkIf config.option.users {
		users."qow" = {
			isNormalUser = true;
			extraGroups = ["wheel"];
			createHome = true;
			shell = pkgs.fish;
		};
	};
}

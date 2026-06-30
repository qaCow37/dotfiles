{config, lib, ...}:{
	options.option = {
		nvidia = lib.mkOption {
			type = lib.types.bool;
			default = false;
		};
	};
	config = {
		hardware = {
			graphics = {
				enable = true;
				enable32Bit = true;
			};
			nvidia = lib.mkIf config.option.nvidia {
				modesetting.enable = true;
				open = false;
				nvidiaSettings = true;
				package = config.boot.kernelPackages.nvidiaPackages.stable;
			};
		};
		services.xserver.videoDrivers = lib.mkIf config.option.nvidia ["nvidia"];
	};
}

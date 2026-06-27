{config, lib, pkgs, ...}:
{
	options.option = {
		ly_resolution_fix = lib.mkOption {
			type = lib.types.bool;
			default = true;
		};
	};
	
	config = {
		programs.niri = {
			enable = true;
			package = pkgs.niri;
		};
		services.displayManager.ly = {
			enable = true;
			settings = {
				clock = "%c";
			};
		};
		
		# ensure that ly renders correctly only on primary monitor
		boot.kernelParams = lib.mkIf config.option.ly_resolution_fix [
			"video=2560x1440"
		];
	};
}

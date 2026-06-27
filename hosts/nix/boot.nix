{lib, pkgs, config, ...}:
{
	options.option = {
		kernel = lib.mkOption {
			type = lib.types.enum [
				"default"
				"zen"
				"cachyos"
			];
			default = "cachyos";
		};
	};
	config.boot = {
		loader = {
			systemd-boot.enable = true;
			efi.canTouchEfiVariables = true;
		};
		kernelPackages =
		let
			kernels = {
				"cachyos" = pkgs.cachyosKernels.linux-cachyos-latest.override {
					cpusched = "bore";
					processorOpt = "native";
					lto = "thin";
					ccHarder = true;
					hzTicks = "1000";
					bbr3 = true;
					hardened = false;
					handheld = false;
				};
				"default" = pkgs.linuxKernel.kernels.linux_7_0;
				"zen" = pkgs.linuxKernel.kernels.linux_zen;
			};
			in pkgs.linuxKernel.packagesFor kernels.${config.option.kernel};
	};
}

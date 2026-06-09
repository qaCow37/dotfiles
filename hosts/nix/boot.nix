{lib, pkgs, flake-config, ...}:
{
	boot = {
		loader = {
			systemd-boot.enable = true;
			efi.canTouchEfiVariables = true;
		};
		kernelPackages = lib.mkIf flake-config.cachyos-kernel
		(let
			kernel = pkgs.cachyosKernels.linux-cachyos-latest.override {
				cpusched = "bore";
				processorOpt = "native";
				lto = "thin";
				ccHarder = true;
				hzTicks = "1000";
				bbr3 = true;
				hardened = false;
				handheld = false;
			};
		in pkgs.linuxKernel.packagesFor kernel);
	};
}

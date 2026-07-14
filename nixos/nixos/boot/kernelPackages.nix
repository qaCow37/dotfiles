{inputs, lib, pkgs, ...}:
let
	base-cachyos-kernel = inputs.cachyos-kernel.packages.${pkgs.system}.linux-cachyos-latest.overrideAttrs
	{
		pname = "cachyos-kernel";

		processorOpt = "native";
		lto = "thin";
		ccHarder = true;
		cpusched = "rt-bore";
		rt = true;
		hzTicks = "1000";
		bbr3 = true;

		autoModules = false;

		# Counter productive for performance
		hardened = false;
		handheld = false;
	};
	cachyos-kernel = base-cachyos-kernel.overrideAttrs (_: {
		structuredExtraConfig = with lib.kernel; {

		};
		enableParallelBuilding = true;
	});

	zen-kernel = pkgs.linuxKernel.kernels.linux_zen;
in
{
	boot.kernelPackages = pkgs.linuxKernel.packagesFor (
		if pkgs.system == "x86_64-linux"
			then cachyos-kernel
			else zen-kernel
	);
}

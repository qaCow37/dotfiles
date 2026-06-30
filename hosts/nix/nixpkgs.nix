{inputs, pkgs, ...}:{
	nixpkgs = {
		overlays = [
			inputs.cachyos-kernel.overlays.default
		];
		config = {
			allowUnfree = true;
		};
	};
}

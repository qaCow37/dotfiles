{
	description = "NixOS Flake for my System";
	inputs = {
		nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
		home-manager.url = "github:nix-community/home-manager";
	};

	outputs = {self, nixpkgs, home-manager, ...}:
	let
		system = "x86_64-linux";
	in
	{
		nixosConfigurations.default = nixpkgs.lib.nixosSystem {
			inherit system;
			pkgs = nixpkgs;
			modules = [
				./hosts/default
				/etc/nixos/hardware-configurations.nix
			];
		};
		homeConfigurations.qow = home-manager.lib.homeManagerConfiguration {
			inherit system;
			modules = [import ./users/qow];
		};
	};
}

{
	description = "NixOS Flake for my System";
	inputs = {
		nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
		home-manager = {
			url = "github:nix-community/home-manager";
			follow = "nixpkgs";
		};
	};

	outputs = {self, nixpkgs, home-manager, ...}:
		let system = "x86_64-linux"
		    pkgs = import nixpkgs {inherit system;};
		in
	{
		nixosConfigurations.default = pkgs.lib.nixosSystem {
			inherit system;
			modules = [
				import ./hosts/default
				/etc/nixos/hardware-configurations.nix
			];
		};
		homeConfigurations.qow = home-manager.lib.homeManagerConfiguration {
			inherit system;
			modules = [import ./users/qow];
		};
	};
}

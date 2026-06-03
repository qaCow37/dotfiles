{
	description = "NixOS Flake for my System";
	inputs = {
		nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
		home-manager = {
			url = "github:nix-community/home-manager";
			inputs.nixpkgs.follows = "nixpkgs";
		};
	};

	outputs = {self, nixpkgs, home-manager, ...}:
	let
		system = "x86_64-linux";
		pkgs = nixpkgs.legacyPackages.${system};
	in
	{
		nixosConfigurations.default = nixpkgs.lib.nixosSystem {
			inherit pkgs system;
			modules = [
				{networking.hostName="nix";}
				{
					environment.systemPackages = [
						home-manager.pacakges.${system}.home-manager
					];
				}
				./hosts/default
				/etc/nixos/hardware-configuration.nix
			];
		};
		homeConfigurations."qow" = home-manager.lib.homeManagerConfiguration {
			inherit pkgs system;
			modules = [import ./users/qow];
		};
	};
}

{
	description = "NixOS Flake for my System";
	inputs = {
		nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
		home-manager = {
			url = "github:nix-community/home-manager";
			inputs.nixpkgs.follows = "nixpkgs";
		};
		zen-browser = {
			url = "github:0xc000022070/zen-browser-flake";
			inputs.nixpkgs.follows = "nixpkgs";
			inputs.home-manager.follows = "home-manager";
		};
		firefox-addons = {
			url = "gitlab:rycee/nur-expressions?dir=pkgs/firefox-addons";
			inputs.nixpkgs.follows = "nixpkgs";
		};
		spicetify-nix.url = "github:Gerg-L/spicetify-nix";
	};

	outputs = {self, nixpkgs, home-manager, ...}@inputs:
	let
		system = "x86_64-linux";
		pkgs = nixpkgs.legacyPackages.${system};
	in
	{
		nixosConfigurations.nix = nixpkgs.lib.nixosSystem {
			inherit pkgs system;
			modules = [
				{
					networking.hostName = "nix";
					environment.systemPackages = [
						home-manager.packages.${system}.home-manager
					];
				}
				./hosts/nix
				/etc/nixos/hardware-configuration.nix
			];
			specialArgs = {inputs=inputs;};
		};
		homeConfigurations.qow = home-manager.lib.homeManagerConfiguration {
			inherit pkgs;
			modules = [
				inputs.spicetify-nix.homeManagerModules.spicetify
				inputs.zen-browser.homeModules.beta
				./users/qow
			];
			extraSpecialArgs = {
				flakeRoot = self;
				system = system;
				inputs = inputs;
			};
		};
	};
}

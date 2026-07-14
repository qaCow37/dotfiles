{
	description = "NixOS Flake for my System";
	inputs = {
		nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
		home-manager = {
			url = "github:nix-community/home-manager";
			inputs.nixpkgs.follows = "nixpkgs";
		};

		cachyos-kernel = {
			url = "github:xddxdd/nix-cachyos-kernel";
			inputs.nixpkgs.follows = "nixpkgs";
		};
		catppuccin = {
			url = "github:catppuccin/nix";
			inputs.nixpkgs.follows = "nixpkgs";
		};
		zen-browser = {
			url = "github:0xc000022070/zen-browser-flake";
			inputs.nixpkgs.follows = "nixpkgs";
			inputs.home-manager.follows = "home-manager";
		};
		nixcord = {
			url = "github:FlameFlag/nixcord";
			inputs.nixpkgs.follows = "nixpkgs";
			inputs.nixpkgs-nixcord.follows = "nixpkgs";
		};
		spicetify = {
			url = "github:Gerg-L/spicetify-nix";
			inputs.nixpkgs.follows = "nixpkgs";
		};
		yazi = {
			url = "github:sxyazi/yazi";
			inputs.nixpkgs.follows = "nixpkgs";
		};
		nixvim = {
			url = "github:nix-community/nixvim";
			inputs.nixpkgs.follows = "nixpkgs";
		};
		niri = {
			url = "github:epireyn/niri-flake";
			inputs.nixpkgs.follows = "nixpkgs";
		};

		# prismlauncher = {
		# 	url = "path:/home/qow/prismlauncher-nix";
		# 	inputs.nixpkgs.follows = "nixpkgs";
		# };
		#thcrap = {
		#	url = "path:/home/qow/thcrap-flake";
		#	inputs.nixpkgs.follows = "nixpkgs";
		#};
	};

	outputs = {self, nixpkgs, home-manager, ...}@inputs:
	let
		defaultSpecialArgs = {
			flake = self;
			inputs = inputs;
		};
	in
	{
		nixosConfigurations =
		{
			"nixos" = nixpkgs.lib.nixosSystem {
				system = "x86_64-linux";

				modules = [
					({pkgs, ...}:{
						environment.systemPackages = [
							home-manager.packages.${pkgs.system}.home-manager
						];
					})
					./nixos/nixos
					/etc/nixos/hardware-configuration.nix
				];
				specialArgs = defaultSpecialArgs;
			};
		};
		homeConfigurations = {
			"qow" = home-manager.lib.homeManagerConfiguration {
				pkgs = import nixpkgs {system = "x86_64-linux";};
				modules = [
					inputs.catppuccin.homeModules.catppuccin
					inputs.spicetify.homeManagerModules.spicetify
					inputs.zen-browser.homeModules.beta
					inputs.nixvim.homeModules.nixvim
					inputs.nixcord.homeModules.nixcord
					inputs.niri.homeModules.niri
					./home/qow
				];
				extraSpecialArgs = defaultSpecialArgs;
			};
		};
	};
}

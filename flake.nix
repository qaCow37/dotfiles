{
	description = "NixOS Flake for my System";
	inputs = {
		nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
		cachyos-kernel = {
			url = "github:xddxdd/nix-cachyos-kernel";
			inputs.nixpkgs.follows = "nixpkgs";
		};
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
		spicetify-nix = {
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
	};

	outputs = {self, nixpkgs, home-manager, ...}@inputs:
	let
		system = "x86_64-linux";
		pkgs = import nixpkgs {
			inherit system;
			config = {
				allowUnfree = true;
			};
		};
		defaultSpecialArgs = {
			system = system;
			inputs = inputs;
			flake-config = {
				cachyos-kernel = false;
			};
			path = {
				root   = "${self}";
				assets = "${self}/assets";
				config = "${self}/config";
			};
		};
	in
	{
		nixosConfigurations =
		let
			hostNameMod =
			{
				networking.hostName = "nix";
			};
			homeManagerMod =
			{
				environment.systemPackages = [
					home-manager.packages.${system}.home-manager
				];
			};
			overlaysMod =
			{
				nixpkgs.overlays = with inputs; [
					cachyos-kernel.overlays.default
				];
			};
		in
		{
			"nix" = nixpkgs.lib.nixosSystem {
				inherit pkgs system;
				modules = [
					hostNameMod
					homeManagerMod
					overlaysMod
					./hosts/nix
					/etc/nixos/hardware-configuration.nix
				];
				specialArgs = pkgs.lib.recursiveUpdate defaultSpecialArgs {
					flake-config = {
						cachyos-kernel = true;
					};
				};
			};
			"nix-default-kernel" = nixpkgs.lib.nixosSystem {
				inherit pkgs system;
				modules = [
					hostNameMod
					homeManagerMod
					overlaysMod
					./hosts/nix
					/etc/nixos/hardware-configuration.nix
				];
				specialArgs = defaultSpecialArgs;
			};
		};
		homeConfigurations."qow" = home-manager.lib.homeManagerConfiguration {
			inherit pkgs;
			modules = [
				inputs.spicetify-nix.homeManagerModules.spicetify
				inputs.zen-browser.homeModules.beta
				inputs.nixvim.homeModules.nixvim
				./users/qow
			];
			extraSpecialArgs = defaultSpecialArgs;
		};
	};
}

{
	# TODO:
	# - Configure Starship
	# - Configure FastFetch
	# - Configure Yazi
	# - Configure Maybe Vesktop
	# - THCRAP and THPRAC Flake
	# - Prism Launcher Flake
	# - Satisfactory Mod Manager Flake
	
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
		};
		firefox-addons = {
			url = "gitlab:rycee/nur-expressions?dir=pkgs/firefox-addons";
			inputs.nixpkgs.follows = "nixpkgs";
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
		prism-nix = {
			url = "path:/home/qow/prism-nix";
			inputs.nixpkgs.follows = "nixpkgs";
		};
		#thcrap = {
		#	url = "path:/home/qow/thcrap-flake";
		#	inputs.nixpkgs.follows = "nixpkgs";
		#};
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
		hostname = "nix";
		defaultSpecialArgs = {
			system = system;
			inputs = inputs;
			flake-config = {
				cachyos-kernel = false;
			};
			path = {
				root   = "${self}";
				assets = "${self}/assets";
				#config = "${self}/config";
			};
			hostname = hostname;
		};
	in
	{
		nixosConfigurations =
		let
			hostNameMod =
			{
				networking.hostName = hostname;
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
			${hostname} = nixpkgs.lib.nixosSystem {
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
			"${hostname}-default-kernel" = nixpkgs.lib.nixosSystem {
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
				inputs.catppuccin.homeModules.catppuccin
				inputs.spicetify.homeManagerModules.spicetify
				inputs.zen-browser.homeModules.beta
				inputs.nixvim.homeModules.nixvim
				inputs.nixcord.homeModules.nixcord
				/*inputs.thcrap.homeModules.thcrap
				{
						config = {
							patches = [
								{
									id = "en";
									patches = [
										{
											id = "base_tsa";
											repo = "nmlgc";
										}
									];
								}
							];
							#repositories = [
							#	{
							#		name = "nmlgc";
							#		url = "https://mirrors.thpatch.net/nmlgc/repo.js";
							#		hash = "sha256-OgCjUYafxJGEYGULkmdFnaTxbU+UAe1aj1krIM3PRUc=";
							#	}
							#];
							wrapper-script.enable = true;
						};
					};
				}*/
				inputs.prism-nix.homeModules.prism-nix
				{
					programs.prism-nix = {
						enable = true;
						instances = {
							myInstance = {
								config = {
									name = "myInstance";
								};

								components = with inputs.prism-nix.prism-components; [
									(minecraft "1.21.11")
									(fabric    "0.19.3" )
								];

								minecraft = {
									options = {
										somekey = "Hello World!";
									};
										#mods = [
										#	{
										#	id = "";
										#}
										#];
								};
							};
						};
					};
				}
				./users/qow
			];
			extraSpecialArgs = defaultSpecialArgs // {
				username = "qow";
			};
		};
	};
}

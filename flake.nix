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
			path = {
				root   = "${self}";
				assets = "${self}/assets";
				#config = "${self}/config";
			};
		};
		
		overlaysMod = {...}:
		{
			nixpkgs.overlays = with inputs; [
				cachyos-kernel.overlays.default
			];
		};
		optionsMod = {options, lib,...}:
		{
			config.option = lib.concatMapAttrs (key: val:
				let
					env = builtins.getEnv "OPT_${
						lib.strings.toUpper key
					}";
				in
				{
					${key} = lib.mkIf (env != "")
					{
						"int"  = lib.strings.toInt env;
						"bool" = env == "1";
					}.${val.type.name} or env;
				}
			) options.option;
		};
	in
	{
		nixosConfigurations =
		{
			"nix" = nixpkgs.lib.nixosSystem {
				inherit pkgs system;
				modules = [
					overlaysMod
					optionsMod
					{
						environment.systemPackages = [
							home-manager.packages.${system}.home-manager
						];
					}
					./hosts/nix
					/etc/nixos/hardware-configuration.nix
				];
				specialArgs = defaultSpecialArgs;
			};
		};
		homeConfigurations."qow" = home-manager.lib.homeManagerConfiguration {
			inherit pkgs;
			modules = [
				overlaysMod
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
				# inputs.prismlauncher.homeModules.prismlauncher-nix
				# {
				# 	programs.prismlauncher-nix = {
				# 		enable = true;
				# 		instances = {
				# 			"main" = {
				# 				config = {
				# 					general = {
				# 						name = "main";
				# 					};
				# 				};
				# 				components = with inputs.prismlauncher.components; [
				# 					(minecraft "1.21.11")
				# 					fabric
				# 				];
				# 			};
				# 		};
				# 	};
				# }
				./users/qow
			];
			extraSpecialArgs = defaultSpecialArgs // {
				username = "qow";
			};
		};
	};
}

{
	programs.zen-browser.profiles.default.search = {
		force = true;
		default = "brave";
		engines = {
			"brave" = {
				name = "Brave";
				urls = [
					{
						template = "https://search.brave.com/search?q={searchTerms}";
					}
				];
			};
			"mynixos" = {
				name = "My NixOS";
				urls = [
					{
						template = "https://mynixos.com/search?q={searchTerms}";
					}
				];
				definedAliases = ["@nix"];
			};
			"steamdb" = {
				name = "SteamDB";
				urls = [
					{
						template = "https://steamdb.info/search/?q={searchTerms}";
					}
				];
				definedAliases = ["@steam"];
			};
			"protondb" = {
				name = "ProtonDB";
				urls = [
					{
						template = "https://www.protondb.com/search?q={searchTerms}";
					}
				];
				definedAliases = ["@proton"];
			};
			"reddit" = {
				name = "Reddit";
				urls = [
					{
						template = "https://www.reddit.com/search/?q={searchTerms}";
					}
				];
				definedAliases = ["@rdd"];
			};
		};
	};
}

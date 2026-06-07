{config, pkgs, inputs, system, ...}:
{
	programs.zen-browser = {
		enable = true;
		setAsDefaultBrowser = true;
		policies = {
			AutofillAddressEnabled = false;
			AutofillCreditCardEnabled = false;
			DisableAppUpdate = true;
			DisableFeedbackCommands = true;
			DisableFirefoxStudies = true;
			DisablePocket = true;
			DisableTelemetry = true;
			DontCheckDefaultBrowser = true;
			NoDefaultBookmakrs = true;
			OfferToSaveLogins = false;
			EnableTrackingProtection = {
				Value = true;
				Locked = true;
				Cryptomining = true;
				Fingerprinting = true;
			};
			PictureInPicture = false;
			SearchSuggestEnabled = false;
			TranslateEnabled = false;
			SearchEngines = {
				HideDefaultSearchEngines = true;
				Default = "brave";
				PreventInstalls = true;
			};
		};
	};
	programs.zen-browser.policies.Preferences = {
		"browser.aboutConfig.showWarning" = {
			Value = false;
			Status = "locked";
		};
	};
	programs.zen-browser.profiles.default = {
		search = {
			force = true;
			default = "brave";
			engines = {
				"brave" = {
					name = "Brave";
					urls = [
						{
							template = "https://search.brave.com/search?q={searchTerms}";
							params = [
								{
									name = "query";
									value = "searchTerms";
								}
							];
						}
					];
				};
				"mynixos" = {
					name = "My NixOS";
					urls = [
						{
							template = "https://mynixos.com/search?q={searchTerms}";
							params = [
								{
									name = "query";
									value = "searchTerms";
								}
							];
						}
					];
					definedAliases = ["@nix"];
				};
				"steamdb" = {
					name = "SteamDB";
					urls = [
						{
							template = "https://steamdb.info/search/?q={searchTerms}";
							params = [
								{
									name = "query";
									value = "searchTerms";
								}
							];
						}
					];
					definedAliases = ["@steam"];
				};
				"protondb" = {
					name = "ProtonDB";
					urls = [
						{
							template = "https://www.protondb.com/search?q={searchTerms}";
							params = [
								{
									name = "query";
									value = "searchTerms";
								}
							];
						}
					];
					definedAliases = ["@proton"];
				};
			};
		};
		settings = {
			# Layout to Sidebar + Toolbar
			"zen.view.use-single-toolbar" = false;
			"zen.view.sidebar-expanded" = true;
			"zen.view.sidebar-expanded.max-width" = 400;

			"layout.spellcheckDefault" = 0;
			"zen.workspaces.continue-where-left-off" = true;
			"zen.welcome-screen.seen" = true;
			"media.videocontrols.picture-in-picture.video-toggle.enabled" = false;

			# Required by Mod or Extension
			"browser.ctrlTab.sortByRecentlyUsed" = true; # CTRL+TAB Panel
			"zen.urlbar.replace-newtab" = false;         # Bonjourr

			# Search Suggestions
			"browser.urlbar.suggest.addons" = false;
			"browser.urlbar.suggest.openpage" = false;
			"browser.urlbar.suggest.recentsearches" = false;
			"browser.urlbar.suggest.clipboard" = false;
			"browser.urlbar.suggest.engines" = false;
			"browser.urlbar.suggest.history" = false;
			"browser.urlbar.suggest.mdn" = false;
			"browser.urlbar.suggest.quickactions" = false;
			"browser.urlbar.suggest.trending" = false;
			"browser.urlbar.suggest.sports" = false;
			"browser.urlbar.suggest.weather" = false;
			"browser.urlbar.suggest.wikipedia" = false;
			"browser.urlbar.suggest.yelp" = false;
		};
		extensions.packages = with inputs.firefox-addons.packages.${system}; [
			ublock-origin
			zen-internet
			darkreader
			bonjourr-startpage
		];
		mods = [
			# Transparent-Zen
			"642854b5-88b4-4c40-b256-e035532109df"
			# Better CTRL+TAB Panel
			"72f8f48d-86b9-4487-acea-eb4977b18f21"
		];
		bookmarks = {
			force = true;
			settings = [
				{
					name = "bookmarks";
					bookmarks = [
						{
							name = "BraveAI";
							url = "https://search.brave.com/ask";
						}
					];
				}
			];
		};
		spaces = {
			"Personal" = {
				id = "f6ee1c39-172c-5370-2b11-320409caf2db";
				position = 1000;
				theme = {
					type = "gradient";
					colors = [
						{
							red = 50;
							green = 50;
							blue = 50;
							algorithm = "floating";
							type = "explicit-lightness";
							lightness = 0;
						}
					];
					opacity = 0.0;
					texture = 0.0;
				};
			};
		};
		spacesForce = true;
	};
}

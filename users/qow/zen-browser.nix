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
		};
	};
	programs.zen-browser.policies.Preferences = {
		"browser.startup.homepage" = {
			Value = "about:home";
			Status = "locked";
		};
		"zen.urlbar.replace-newtab" = {
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
							template = "https://search.brave.com/search?q=${searchTerms}";
							params = [
								{
									name = "query";
									value = "searchTerms";
								}
							];
						}
					];
				};
			};
		};
		settings = {
			"zen.workspaces.continue-where-left-off" = true;
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
		];
	};
}

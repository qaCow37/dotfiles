{
	imports = [
		./extensions.nix
		./preferences.nix
	];

	programs.zen-browser.policies = {
		AutofillAddressEnabled = false;
		AutofillCreditCardEnabled = false;
		OfferToSaveLogins = false;

		DisableAppUpdate = true;
		DisableFeedbackCommands = true;
		DisableFirefoxStudies = true;
		DisablePocket = true;
		DisableTelemetry = true;
		DontCheckDefaultBrowser = true;

		EnableTrackingProtection = {
			Value = true;
			Locked = true;
			Cryptomining = true;
			Fingerprinting = true;
			SuspectedFingerprinting = true;
			EmailTracking = true;
			Category = "strict";
			BaselineExceptions = false;
			ConvenienceExceptions = false;
		};
		# Can not get this to work smwh?
		# DNSOverHTTPS = {
		# 	Enabled = true;
		# 	Locked = true;
		# 	ProviderURL = "https://dns.quad9.net/dns-query";
		# 	Fallback = true;
		# };

		PictureInPicture = {
			Enabled = false;
			Locked = true;
		};
		TranslateEnabled = false;
	};
}

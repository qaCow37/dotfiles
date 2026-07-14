{
	programs.zen-browser.policies.Preferences = builtins.mapAttrs (
		k: v: {
			Value = v;
			Status = "locked";
		}
	)
	{
		# Other
		"browser.aboutConfig.showWarning" = false;
		"media.videocontrols.picture-in-picture.video-toggle.enabled" = false;

		# Privacy
		"privacy.resistFingerprinting" = true;
		"privacy.resistFingerprinting.randomization.canvas.use_siphash" = true;
		"privacy.resistFingerprinting.randomization.daily_reset.enabled" = true;
		"privacy.resistFingerprinting.randomization.daily_reset.private.enabled" = true;
		"privacy.resistFingerprinting.block_mozAddonManager" = true;
		"privacy.spoof_english" = 1;

		# Cookies and Network
		"privacy.firstparty.isolate" = true;
		"network.cookie.cookieBehavior" = 5;
		"network.http.http3.enabled" = true;
		"network.socket.ip_addr_any.disabled" = true;

		# Search Suggestions
		"browser.urlbar.suggest.addons"         = false;
		"browser.urlbar.suggest.openpage"       = false;
		"browser.urlbar.suggest.recentsearches" = false;
		"browser.urlbar.suggest.clipboard"      = false;
		"browser.urlbar.suggest.engines"        = false;
		"browser.urlbar.suggest.history"        = false;
		"browser.urlbar.suggest.mdn"            = false;
		"browser.urlbar.suggest.quickactions"   = false;
		"browser.urlbar.suggest.trending"       = false;
		"browser.urlbar.suggest.sports"         = false;
		"browser.urlbar.suggest.weather"        = false;
		"browser.urlbar.suggest.wikipedia"      = false;
		"browser.urlbar.suggest.yelp"           = false;
	};
}

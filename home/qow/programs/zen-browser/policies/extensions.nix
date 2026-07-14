{...}:
{
	programs.zen-browser.policies.ExtensionSettings =
	let
		extension = {id, private?false}: {
			install_url = "https://addons.mozilla.org/firefox/downloads/latest/${id}/latest.xpi";
			installation_mode = "force_installed";
			private_browsing = private;
		};
	in
	{
		"uBlock0@raymondhill.net"                = extension {id="ublock-origin"; private = true;};
		"{d7742d87-e61d-4b78-b8a1-b469842139fa}" = extension {id="vimium-ff";   };
		"{91aa3897-2634-4a8a-9092-279db23a7689}" = extension {id="zen-internet";};
	};
}

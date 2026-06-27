{...}:{
	
	programs.nixcord = {
		enable = true;
		vesktop.enable = true;
	
		discord = {
			enable = false;
			vencord.enable = true;
			krisp.enable = true;
		};

		config = {
			autoUpdate = false;

			# I love transparency, dont I!
			transparent = true;
			frameless = true;
			useQuickCss = true;

			themeLinks        = ["https://catppuccin.github.io/discord/dist/catppuccin-mocha.theme.css"];
			enabledThemeLinks = ["https://catppuccin.github.io/discord/dist/catppuccin-mocha.theme.css"];

			plugins = {
				fakeNitro = {
					enable = true;
					enableEmojiBypass = false;
					enableStickerBypass = false;
					enableStreamQualityBypass = true;
				};
			};
		};
	};
}

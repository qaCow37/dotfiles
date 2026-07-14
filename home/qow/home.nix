{pkgs, ...}:
{
	home = {
		stateVersion = "26.05";
		username = "qow";
		homeDirectory = "/home/qow";

		packages = with pkgs; [
			wl-clipboard
			krita

			# Noto Fonts
			noto-fonts
			noto-fonts-cjk-sans
			noto-fonts-cjk-serif
			noto-fonts-color-emoji

			# Nerd Fonts
			nerd-fonts.jetbrains-mono
		];

		pointerCursor = {
			package = pkgs.bibata-cursors;
			name = "Bibata-Modern-Classic";
			size = 16;
		};
	};
}

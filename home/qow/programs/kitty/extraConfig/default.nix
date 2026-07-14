{
	imports = [./maps.nix];

	programs.kitty.extraConfig =
	''
		font_family        JetbrainsMono Nerd Font
		bold_font          auto
		italic_font        auto
		bold_italic_font   auto
		font_size          20.0

		background_opacity 0.6
		background_blur    1
		background         #000000
	'';
}

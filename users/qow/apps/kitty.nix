{...}:
{
	programs.kitty = {
		enable = true;
		extraConfig = ''
			background_opacity 0.5
			background_blur    1
			background         #000000

			font_family      JetbrainsMono Nerd Font
			bold_font        auto
			italic_font      auto
			bold_italic_font auto
			font_size        15.0

			clear_all_shortcuts yes
			map alt+j scroll_line_down
			map alt+k scroll_line_up
			map alt+d scroll_page_down
			map alt+u scroll_page_up

			map alt+y copy_to_clipboard
		'';
	};
}

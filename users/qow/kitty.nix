{...}:
{
	programs.kitty = {
		enable = true;
		extraConfig = ''
			background_opacity 0.0
			# Let Hyprland handle blur
			background_blur 1
		'';
	};
}

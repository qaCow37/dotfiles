{
	imports = [
		./catppuccin.nix
		
		./functions
	];
	programs.fish = {
		enable = true;
		interactiveShellInit =
		''
			clear
			set -g fish_greeting
			fish_vi_key_bindings
		'';
	};
}

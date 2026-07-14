{
	programs.fish.functions."clear" = {
		body =
		''
			command clear $argv
			if test "$TERM" != "linux"
				fastfetch
			end
		'';
		description = "Clear the screen and show fastfetch information.";
	};
}

{
	imports = [
		./policies
		./profiles
	];
	programs.zen-browser = {
		enable = true;
		setAsDefaultBrowser = true;
	};
}

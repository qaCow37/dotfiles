{inputs, pkgs, ...}:
{
	programs.spicetify.enabledExtensions = with inputs.spicetify.legacyPackages.${pkgs.system}.extensions;
	[
		shuffle
		volumePercentage
		hidePodcasts
		keyboardShortcut
	];
}

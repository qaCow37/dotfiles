{inputs, pkgs, ...}:
{
	imports = [
		./extensions.nix
		./snippets.nix
	];
	programs.spicetify = {
		enable = true;

		theme = inputs.spicetify.legacyPackages.${pkgs.system}.themes.catppuccin;
		colorScheme = "mocha";
	};
}

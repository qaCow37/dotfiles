{inputs, ...}:
{
	imports = [
		./keymaps.nix
		./interface.nix
		./editor.nix
	];

	programs.nixvim = {
		enable = true;
		nixpkgs.source = inputs.nixpkgs;

		waylandSupport = true;
		withPerl = false;
		withRuby = false;
		withPython3 = false;

		opts = {
			expandtab = false;
			shiftwidth = 4;
			tabstop = 4;
			softtabstop = 4;
			mouse = "";
			clipboard = "unnamedplus";
		};
		globals = {
			loaded_netrw = 1;
			loaded_netrwPlugin = 1;
		};
	};
}

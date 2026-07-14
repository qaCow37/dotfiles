{inputs, ...}:
{
	imports = [
		./colorschemes.nix
		./globals.nix
		./keymaps.nix
		./opts.nix
		./plugins
	];
	
	programs.nixvim = {
		enable = true;
		nixpkgs.source = inputs.nixpkgs;
		
		waylandSupport = true;
		withPerl = false;
		withRuby = false;
		withPython3 = false;
	};
}

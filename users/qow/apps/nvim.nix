{inputs, ...}:
{
	programs.nixvim = {
		enable = true;
		nixpkgs.source = inputs.nixpkgs;

		opts = {
			number = true;
			expandtab = false;
			shiftwidth = 4;
			tabstop = 4;
			softtabstop = 4;
		};

		colorschemes.tokyonight = {
			enable = true;
			settings = {
				style = "storm";
				transparent = true;
				dimInactive = true;
				styles = {
					comments = {italic=true;};
					keywords = {italic=true;};
					functions = {};
					variables = {};
				};
			};
		};
	};
}

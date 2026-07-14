{
	programs.nixvim.colorschemes = {
		catppuccin = {
			enable = true;
			settings = {
				flavour = "mocha";
				transparent_background = true;
				term_colors = true;
				dim_inactive.enabled = false;
				integrations = {
					telescope = true;
					treesitter = true;
					cmp = true;
					lualine = true;
				};
				float.transparent = true;
			};
		};
	};
}

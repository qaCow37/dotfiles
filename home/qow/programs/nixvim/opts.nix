{
	programs.nixvim.opts = {
		# General opts
		expandtab = false;
		shiftwidth = 4;
		tabstop = 4;
		softtabstop = 4;
		clipboard = "unnamedplus";

		# Input opts
		mouse = "";
		virtualedit = "onemore";
		whichwrap = "hl";

		# Visual opts
		number = true;
		wrap = false;
		signcolumn = "yes:1";
		pumheight = 7;
		winborder = "rounded";
	};
}

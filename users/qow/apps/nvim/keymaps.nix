{...}:
{
	programs.nixvim.keymaps = [
		{
			mode = "i";
			key = "<M-h>";
			action = "<C-\\><C-o>h";
		}
		{
			mode = "i";
			key = "<M-j>";
			action = "<C-\\><C-o>j";
		}
		{
			mode = "i";
			key = "<M-k>";
			action = "<C-o>k";
		}
		{
			mode = "i";
			key = "<M-l>";
			action = "<C-o>l";
		}
	];
	programs.nixvim.opts.virtualedit = "onemore";
	programs.nixvim.extraConfigLua = ''
		vim.opt.whichwrap:append("hl")
	'';
}

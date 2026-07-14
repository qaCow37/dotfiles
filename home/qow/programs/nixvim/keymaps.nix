{
	programs.nixvim.keymaps = [
		{
			mode = "n";
			key = "q";
			action = "<Nop>";
		}

		# Navigation
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

		# Telescope
		{
			mode = "n";
			key = "<leader>f";
			action = "<CMD>Telescope find_files<CR>";
		}
		{
			mode = "n";
			key = "<leader>r";
			action = "<CMD>Telescope buffers<CR>";
		}
		{
			mode = "n";
			key = "<leader>cr";
			action = "<CMD>Telescope registers<CR>";
		}
		{
			mode = "n";
			key = "<leader>gr";
			action = "<CMD>Telescope lsp_references<CR>";
		}
		{
			mode = "n";
			key = "<leader>gd";
			action = "<CMD>Telescope lsp_definitions<CR>";
		}
		{
			mode = "n";
			key = "<leader>gs";
			action = "<CMD>Telescope treesitter<CR>";
		}

		{
			mode = "n";
			key = "<leader>ch";
			action = "<CMD>Telescope command_history<CR>";
		}
		{
			mode = "n";
			key = "<leader>/";
			action = "<CMD>Telescope current_buffer_fuzzy_find<CR>";
		}

		# Questions
		{
			mode = "n";
			key = "qe";
			action.__raw = "vim.diagnostic.open_float";
		}
		{
			mode = "n";
			key = "qq";
			action.__raw = "vim.lsp.buf.hover";
		}
	];
}

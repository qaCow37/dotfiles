{lib, pkgs, ...}:
{
	programs.nixvim.plugins.telescope = {
		enable = true;
		extensions = {
			fzf-native = {
				enable = true;
			};
		};
		settings = {
			defaults = {
				scroll_strategy = "limit";
				sorting_strategy = "ascending";

				border = true;
				result_title = false;
				color_devicons = true;
			};
			pickers = {
				find_files = {
					find_command = [
						# dont want to pollute my system
						"${lib.getExe pkgs.ripgrep}"

						# args needed for ripgrep to function
						"--color=never"
						"--no-heading"
						"--with-filename"
						"--line-number"
						"--column"
						"--smart-case"
						"--files"
					];
					initial_mode = "insert";
				};
				buffers = {
					# sort most recent used
					sort_mru = true;
					initial_mode = "normal";
				};
				registers = {
					initial_mode = "normal";
				};

				lsp_references = {
					reuse_win = true;
					jump_type = "never";
					initial_mode = "normal";
				};
				lsp_definitions = {
					reuse_win = true;
					jump_type = "never";
					initial_mode = "normal";
				};
				treesitter = {
					show_line = true;
					initial_mode = "insert";
				};

				command_history = {
					initial_mode = "normal";
				};
				current_buffer_fuzzy_find = {
					results_ts_highlight = true;
					initial_mode = "insert";
				};
			};
		};
	};
}

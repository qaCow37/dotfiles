{
	programs.nixvim.plugins.nvim-tree = {
		enable = true;
		settings = {
			hijack_cursor = true;
			disable_netrw = true;

			view = {
				width = 40;
				side = "left";
			};
			renderer = {
				group_empty = false;
				icons = {
					show = {
						file = true;
						folder = true;
						folder_arrow = true;
						git = false;
					};
				};
			};

			sort_by = "case_sensitive";
			filters = {
				dotfiles = false;
				custom = [
					"^.git$"
				];
			};

			sync_root_with_cwd = true;
			respect_buf_cwd = true;
			update_focused_file = {
				enable = true;
				update_root = {
					# Updating root conflicts with telescope.builtin.lsp_definitions.
					# If enabled it will update the root to source directory of definition.
					# This will then conflict with CTRL+O.
					enable = false;
				};
			};
		};
	};
}

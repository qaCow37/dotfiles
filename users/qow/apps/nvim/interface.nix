{...}:
{
	programs.nixvim = {
		opts = {
			number = true;
			wrap = false;
			signcolumn = "yes:1";
		};
		globals = {
			# prevent netrw (builtin nvim file explorer) from loading
			# we already have nvim-tree setup
			loaded_netrw = 1;
			loaded_netrwPlugin = 1;
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

		plugins = {
			lualine = {
				enable = true;
				settings = {
					options = {
						theme = "auto";
						icons_enabled = true;
						component_separators = {left = ""; right = "";};
						section_separators =   {left = ""; right = "";};
					};
				};
			};	
			mini = {
				enable = true;
				modules.icons = {
					enable = true;
					emulate_nvim_web_devicons = true;
				};
			};
			nvim-tree = {
				enable = true;
				autoLoad = true;
				settings = {
					sort_by = "case_sensitive";
					view = {
						width = 40;
					};
					renderer = {
						group_empty = false;
						icons = {
							show = {
								git = true;
								folder = true;
								file = true;
							};
						};
					};
					filters = {
						#dotfiles = true;
					};
					git = {
						enable = true;
					};
					disable_netrw = true;
					hijack_netrw = true;
				};
			};
		};
		extraConfigLua = ''
			require("mini.icons").mock_nvim_web_devicons()
		'';
	};
}

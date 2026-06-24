{config, inputs, ...}:
{
	programs.nixvim = {
		enable = true;
		nixpkgs.source = inputs.nixpkgs;

		waylandSupport = true;
		withPerl = false;
		withRuby = false;
		withPython3 = false;

		opts = {
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
		};
		globals = {
			rust_recommended_style = false;
			mapleader = " ";
			loaded_netrw = 1;
			loaded_netrwPlugin = 1;
		};

		keymaps = [
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
				action.__raw = ''
					function()
						require("telescope.builtin").find_files({
							cwd = vim.fn.getcwd(),
							prompt_title = "Find Files in CWD",
						})
					end
				'';
			}
		];

		colorschemes."catppuccin" = {
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

		plugins.mini = {
			enable = true;

			modules.comment = {
				enable = true;
				options = {
					ignore_blank_lines = false;
					start_of_line = false;
					pad_comment_parts = true;
				};
			};
			modules.move = {
				enable = true;
				options = {
					reindent_linewise = true;
				};
			};
			modules.pairs = {
				enable = true;
				modes = {
					insert = true;
					command = false;
					terminal = false;
				};
			};
			modules.trailspace = {
				enable = true;

			};
			# modules.sessions = {
			#	enable = true;
			#	autoread = false;
			#	autowrite = true;
			# };
			modules.icons = {
				enable = true;
				style = "glyph";
			};
		};
		plugins.lualine = {
			enable = true;
		};
		plugins.nvim-tree = {
			enable = true;
			settings = {
				sort_by = "case_sensitive";

				view = {
					width = 50;
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
						enable = true;
					};
				};
			};
		};
		plugins.cmp = {
			enable = true;
			autoEnableSources = true;
			settings = {
				window = {
					completion = {
						border = "rounded";
					};
					documentation = {
						border = "rounded";
					};
				};
				sources = [
					{
						name = "async_path";
						option = {
							trailing_slash = true;
							label_trailing_slash = true;
						};
					}
					{name="nvim_lsp";}
				];
				mapping = {
					"<C-Space>" = "cmp.mapping.complete()";
					"<CR>"      = "cmp.mapping.confirm({select = true})";
					"<C-e>"     = "cmp.mapping.abort()";
					"<Tab>"     = "cmp.mapping.select_next_item()";
					"<S-Tab>"   = "cmp.mapping.select_prev_item()";
				};
			};
			cmdline = {
				":" = {
					sources = [
						{
							name = "cmdline";
							option = {
								ignore_cmds = [
									"Man"
									"!"
								];
							};
						}
						{name="async_path";}
					];
				};
			};
		};
		plugins.treesitter = {
			enable = true;
			highlight.enable = true;
			indent   .enable = true;
			folding  .enable = false;

			grammarPackages = with config.programs.nixvim.plugins.treesitter.package.builtGrammars; [
				rust
				lua
				nix
			];
		};
		plugins.crates = {
			enable = true;
			settings = {
				completion = {
					crates = {
						enabled = true;
						min_chars = 1;
						max_results = 3;
					};
					lsp.enabled = true;
				};
			};
		};
		plugins.lsp = {
			enable = true;
			servers = {
				rust_analyzer = {
					enable = true;
					installCargo = true;
					installRustc = true;
				};
				nixd = {
					enable = true;
				};
				emmylua_ls = {
					enable = true;
				};
			};
		};

		plugins.telescope = {
			enable = false;
			extensions = {
				fzf-native.enable = true;
			};
			settings = {
			};
		};

		extraConfigLua = ''
			require("mini.icons").mock_nvim_web_devicons()
		'';
	};
}

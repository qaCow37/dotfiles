{
	programs.nixvim.plugins.cmp = {
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
}

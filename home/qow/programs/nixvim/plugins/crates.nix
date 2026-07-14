{
	programs.nixvim.plugins.crates = {
		enable = true;
		settings = {
			completion = {
				crates = {
					enabled = true;
					min_chars = 3;
					max_results = 5;
				};
			};
			lsp = {
				enabled = true;
				completion = true;
			};
		};
	};
}

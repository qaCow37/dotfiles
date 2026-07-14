{
	programs.nixvim.plugins.lsp = {
		enable = true;
		servers = {
			rust_analyzer = {
				enable = true;
				installCargo = false;
				installRustc = false;

				# diagnostics = {
				# 	enable = true;
				# };
			};
			nixd = {
				enable = true;
			};
			emmylua_ls = {
				enable = true;
			};
		};
	};
}

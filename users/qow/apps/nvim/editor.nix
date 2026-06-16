{config, hostname, username, ...}:
{
	programs.nixvim = {
		plugins = {
			nvim-autopairs = {
				enable = true;
				settings = {
					fast_wrap = {
						enable = true;
					};
					map_cr = true;
				};
			};
		
			cmp = {
				enable = true;
				autoEnableSources = true;

				settings = {
					mapping = {
						#"<C-Space>" = "cmp.mapping.complete()";
						"<CR>" = "cmp.mapping.confirm({select = true})";
						"<C-e>" = "cmp.mapping.abort()";
						"<Tab>" = "cmp.mapping.select_next_item()";
						"<S-Tab>" = "cmp.mapping.select_prev_item()";
					};
					sources = [
						{name="nvim_lsp";               }
						{name="nvim_lsp_signature_help";}
						{name="async_path";             }
						{name="git";                    }
						{name="crates";                 }
						{name="cmdline";                }
					];
				};
			};
			
			treesitter = {
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

			crates = {
				enable = true;
				settings = {
					completion = {
						cmp = {
							enabled = true;
						};
						crates = {
							enabled = true;
							min_chars = 1;
						};
					};
				};
			};

			lsp = {
				enable = true;
				servers = {
					rust_analyzer = {
						enable = true;
						installCargo = true;
						installRustc = true;
					};
					nixd = {
						enable = true;
						
						settings.nixd =
						let
							getFlake = "(builtins.getFlake (toString ./.))";
						in
						{
							nixpkgs = {
								expr = "import ${getFlake}.inputs.nixpkgs { }";
							};
							options = {
								nixos = {
									expr = "${getFlake}.nixosConfigurations.${hostname}.options";
								};
								home_manager = {
									expr = ''${getFlake}.homeConfigurations."${username}@${hostname}".options'';
								};
							};
						};
					};
					emmylua_ls.enable = true;
				};
			};

			overseer = {
				enable = true;
				settings = {
					default_strategy = "terminal";
					
					templates = [
						"builtin"
					];
				};
			};
		};
	};
}

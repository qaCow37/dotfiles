{config, ...}:
{
	programs.nixvim.plugins.treesitter = {
		enable = true;
		highlight.enable = true;
		indent   .enable = true;
		folding  .enable = false;

		grammarPackages = with config.programs.nixvim.plugins.treesitter.package.builtGrammars; [
			rust
			lua
			nix
			json
			toml
		];
	};
}

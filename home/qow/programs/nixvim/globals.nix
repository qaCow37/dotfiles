{lib, pkgs, ...}:
{
	programs.nixvim.globals = {
		rust_recommended_style = false;
		mapleader = " ";
		loaded_netrw = 1;
		loaded_netrwPlugin = 1;

		clipboard = {
			name = "wl-clipboard";
			copy = {
				"+" = "${lib.getExe' pkgs.wl-clipboard-rs "wl-copy"}";
				"*" = "${lib.getExe' pkgs.wl-clipboard-rs "wl-copy"}";
			};
			paste = {
				"+" = "${lib.getExe' pkgs.wl-clipboard-rs "wl-paste"} --no-newline";
				"*" = "${lib.getExe' pkgs.wl-clipboard-rs "wl-paste"} --no-newline --primary";
			};
			cache_enabled = true;
		};
	};
}

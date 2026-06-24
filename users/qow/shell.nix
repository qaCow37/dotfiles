{lib, pkgs, path, ...}:
{
	programs.fish = {
		enable = true;
		package = pkgs.fish;
		functions = {
			"clear" = {
				body = ''
					command clear $argv
					fastfetch
				'';
				description = "Clear the screen and show fastfetch information.";
			};
		};
		interactiveShellInit = ''
			clear
			set -g fish_greeting
			fish_vi_key_bindings
		'';
	};
	catppuccin.fish.enable = true;
	
	programs.starship = {
		enable = true;
		enableFishIntegration = true;
		settings = {
			add_newline = false;

			format = lib.concatStrings [
				"$directory◣"
				"$time"
				"$line_break"
				"$character"
			];

			directory = {
				truncation_length = 3;
				truncate_to_repo = false;
				truncation_symbol = "…/";
			};
			time = {
				format = "[$time]($style)";
				time_format = "%H:%M";
				disabled = false;
			};
		};
	};
	catppuccin.starship.enable = true;
	
	programs.fastfetch = {
		enable = true;
		package = pkgs.fastfetch;
		settings = {
			logo = {
				type = "auto";
				source = "${path.assets}/fastfetch/logo.png";
				height = 12;
				preserveAspectRatio = true;
				padding = {
					top = 0;
					left = 0;
					right = 5;
				};
			};
			display = {
				showErrors = true;
				separator = "  ";
				size = {
					binaryPrefix = "jedec";
					ndigits = 0;
					spaceBeforeUnit = "never";
				};
				key = {
					width = 0;
				};
				color = {
					keys = "light_blue";
				};
				constants = [
					"────────"
					"───────────────"
					"   "
				];
			};
			modules = [
				{
					type = "datetime";
					key = " ";
					keyWidth = 0;
					format = "┌{$1}  {weekday-short} - {hour-pretty}:{minute-pretty}  {$1}┐";
				}
				{
					type = "os";
					key = " {$3}sys";
					format = "{pretty-name}";
				}
				{
					type = "kernel";
					key = "{#97}S{#light_blue}{$3}ker";
					format = "{release}";
				}
				{
					type = "wm";
					key = "{#97}Y{#light_blue}{$3}wmn";
					format = "{pretty-name}";
				}
				{
					type = "shell";
					key = "{#97}S{#light_blue}{$3}shl";
					format = "{pretty-name}";
				}
				{
					type = "packages";
					key = " {$3}pkg";
					format = "{all}";
				}
				{
					type = "custom";
					key = " ";
					keyWidth = 0;
					format = "├───────";
				}
				{
					type = "cpu";
					key = " {$3}cpu";
					format = "{name}";
				}
				{
					type = "gpu";
					key = "{#97}H{#light_blue}{$3}gpu";
					format = "{name}";
					hideType = "integrated";
				}
				{
					type = "memory";
					key = "{#97}W{#light_blue}{$3}mem";
					format = "{used} / {total}";
				}
				{
					type = "disk";
					key = " {$3}dsk";
					format = "{filesystem}: {size-total}";
					folders = "/";
				}
				{
					type = "custom";
					key = " ";
					keyWidth = 0;
					format = "└{$1}{$2}{$1}┘";
				}
			];
		};
	};
}

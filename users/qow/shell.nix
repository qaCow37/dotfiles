{pkgs, ...}:
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
		'';
	};
	programs.starship = {
		enable = true;
		enableFishIntegration = true;
		settings = {
			# customize at some point
		};
	};
	programs.fastfetch = {
		enable = true;
		package = pkgs.fastfetch;
		settings = {
			display = {
				separator = "  ";
				key = {
					width = 14;
				};
				color = {
					keys = "blue";
				};
			};
			logo = {
				source = "nixos_small";
				padding.left  = 2;
				padding.right = 2;
			};
			modules = [
				{
					type = "datetime";
					key = "Date";
					format = "{8} - {14}:{18}";
				}
				"os"
				"kernel"
				"packages"
				"cpu"
				{
					type = "gpu";
					hideType = "integrated";
					driverSpecific = false;
				}
				"memory"
			];
		};
	};
}

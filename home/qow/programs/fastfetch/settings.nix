{flake, ...}:
{
	programs.fastfetch.settings = {
		display = {
			# who tf decided I dont want to see errors???
			showErrors = true;

			size = {
				binaryPrefix = "jedec";
				ndigits = 0;
				spaceBeforeUnit = "never";
			};

			# add four spaces
			key.width = 7;
			separator = "";
			color.output = "#eff1f5";
		};

		logo = {
			type = "kitty";
			source = "${flake}/assets/fastfetch/logo.png";
			preserveAspectRatio = true;

			height = 6;
			padding = {
				top   = 1;
				left  = 3;
				right = 5;
			};
		};

		modules = [
			{
				# Catccuppin
				# User: Peach
				type = "title";
				format = "{##fe640b}{user-name}@{host-name}";
			}
			{
				type = "os";
				key = "sys";
				format = "{pretty-name}";

				# Catccuppin
				# Rosewater
				keyColor = "#dc8a78";
			}
			{
				type = "kernel";
				key = "ker";
				format = "{release}";

				# Catccuppin
				# Flamingo
				keyColor = "#dd7878";
			}
			{
				type = "packages";
				key = "pkg";
				format = "{all}";
				keyColor = "#d84c54";
			}

			{
				type = "cpu";
				key = "cpu";
				format = "{name}";

				# Catccuppin
				# Red
				keyColor = "#d20f39";
			}
			{
				type = "gpu";
				key = "gpu";
				format = "{name}";
				hideType = "integrated";

				# Catccuppin
				# Maroon
				keyColor = "#e64553";
			}
			{
				type = "memory";
				key = "mem";
				format = "{used}/{total}";

				# Catccuppin
				# Peach
				keyColor = "#fe640b";
			}
		];
	};
}

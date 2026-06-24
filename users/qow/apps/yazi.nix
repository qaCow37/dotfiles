{inputs, system, pkgs, ...}:
{
	programs.yazi = {
		enable = true;
		package = inputs.yazi.packages.${system}.default;
		
		# install mount plugin!
		# install catppuccin theme as flavor with transparent background
	};
}

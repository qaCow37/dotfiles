{inputs, system, pkgs, ...}:
{
	programs.yazi = {
		enable = true;
		package = inputs.yazi.packages.${system}.default;
				
		# install mount plugin!
	};
}

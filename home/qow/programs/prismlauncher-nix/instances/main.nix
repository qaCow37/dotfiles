{inputs, pkgs, ...}:
let
	mc = inputs.prismlauncher-nix;
	resources = mc.resources.${pkgs.system};
in
{
	programs.prismlauncher-nix.instances."main" = {
		config = {
			name = "main";
		};
		components = with mc.components."1.21.11"; [
			game
			fabric
		];
		resources = [
			(resources.options {

			})
		];
	};
}

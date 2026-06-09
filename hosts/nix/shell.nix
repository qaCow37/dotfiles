{pkgs, ...}:
{
	programs.fish = {
		enable = true;
		package = pkgs.fish;
	};
	environment.systemPackages = [
		pkgs.fastfetch
	];
}

{pkgs, ...}:
{
	users.users = {
		"qow" = {
			isNormalUser = true;
			extraGroups = ["wheel"];
			createHome = true;
			shell = pkgs.fish;
			ignoreShellProgramCheck = true;
		};
	};
}

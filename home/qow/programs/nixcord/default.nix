{
	imports = [./legcord.nix];

	programs.nixcord = {
		enable = true;
		discord.enable = false;
	};
}

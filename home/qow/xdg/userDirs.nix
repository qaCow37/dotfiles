{config, ...}:
{
	xdg.userDirs = let home = config.home.homeDirectory; in
	{
		enable = true;
		createDirectories = true;
		music       = "${home}/assets/music";
		videos      = "${home}/assets/videos";
		pictures    = "${home}/assets/pictures";
		documents   = "${home}/assets/documents";
		templates   = "${home}/assets/.templates";
		publicShare = "${home}/assets/.public-share";
		desktop     = "${home}/assets/.desktop";
		download    = "${home}/downloads";
		projects    = "${home}/projects";
	};
}

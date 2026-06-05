{...}:{
	users.users."qow" = {
		isNormalUser = true;
		extraGroups = ["wheel"];
		createHome = true;
	};

	environment.sessionVariables = {
		XDG_DATA_HOME   = "$HOME/.local/share";
		XDG_CONFIG_HOME = "$HOME/.config";
		XDG_CACHE_HOME  = "$HOME/.cache";
		XDG_STATE_HOME  = "$HOME/.local/state";
	};
}

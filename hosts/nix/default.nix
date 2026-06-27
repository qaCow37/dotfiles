{pkgs, ...}:
{
	imports = [
		./boot.nix
		./fonts.nix
		./shell.nix
		./network.nix
		./greet.nix
		./users.nix
	];
	networking.hostName = "nix";

	programs.steam.enable = true;

	services.pipewire = {
 		enable = true;
		alsa.enable = true;
		alsa.support32Bit = true;
		pulse.enable = true;
		wireplumber.enable = true;
	};

	services.udisks2.enable = true;

	programs.git.enable = true;
	programs.localsend.enable = true;

	programs.java = {
		enable = true;
		package = pkgs.zulu25;
	};

	programs.ns-usbloader.enable = true;

	environment.systemPackages = with pkgs; [
		unzip
		imagemagick
		wiremix
		zenity
		jq
		wl-clipboard
		#xwayland-satellite
		cargo
		rustc
		tuigreet
	];

	hardware = {
		graphics = {
			enable = true;
			enable32Bit = true;
		};
	};

	services.playerctld = {
		enable = true;
		package = pkgs.playerctl;
	};
}

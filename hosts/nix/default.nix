{config, pkgs, inputs, ...}:
{
	boot.loader.systemd-boot.enable = true;
	boot.loader.efi.canTouchEfiVariables = true;

	imports = [
		./fonts.nix
		./sddm.nix
		./users.nix
	];

	programs.steam.enable = true;

	services.pipewire = {
 		enable = true;
		alsa.enable = true;
		alsa.support32Bit = true;
		pulse.enable = true;
		wireplumber.enable = true;
	};

	programs.git.enable = true;
	
	programs.java = {
		enable = true;
		package = pkgs.zulu25;
	};

	environment.systemPackages = with pkgs; [
		unzip
		imagemagick
		wiremix
		playerctl
		zulu11
		zulu21
		zenity
	];

	hardware = {
		graphics = {
			enable = true;
			enable32Bit = true;
		};
	};
}

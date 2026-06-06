{config, pkgs, inputs, ...}:
{
	boot.loader.systemd-boot.enable = true;
	boot.loader.efi.canTouchEfiVariables = true;

	imports = [
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

	environment.systemPackages = with pkgs; [
		kitty
		git
		fastfetch
	];
	hardware.graphics = {
		enable = true;
		enable32Bit = true;
	};
}

{config, pkgs, inputs, ...}:
{
	boot.loader.systemd-boot.enable = true;
	boot.loader.efi.canTouchEfiVariables = true;

	imports = [
		./users.nix
	];

	environment.systemPackages = with pkgs; [
		kitty
		git
		fastfetch
	];
	hardware.graphics.enable = true;
	programs.hyprland.enable = true;
}

{...}:
{
	boot.loader.systemd-boot.enable = true;
	boot.loader.efi.canTouchEfiVariables = true;

	imports = [
		./users.nix
	];
}

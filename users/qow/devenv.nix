{pkgs, ...}:
{
	home.packages = with pkgs; [
		#rustup
		cargo
		rustc
		xmake
		love
		clang
	];
}

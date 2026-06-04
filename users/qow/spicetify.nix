{config, pkgs, inputs, system, ...}:
let
	spicePkgs = inputs.spicetify-nix.legacyPackages.${system};
in
{
	programs.spicetify = {
		enable = true;
		enabledExtensions = with spicePkgs.extensions; [
			shuffle
			volumePercentage
		];
		enabledSnippets = [
			# "title" = "Declutter now playing bar";
			# "description" = "Remove all extra elements from now playing bar except song details";
			".main-nowPlayingView-section{ display:none; } .main-nowPlayingView-aboutArtistV2{ display:none; } .nw2W4ZMdICuBo08Tzxg9 { justify-content: center; height: 100%; width: 100%; } .Loading{ display:none !important; } .LoadingLyricsCard{ display:none !important; } .f6_Fu_ei4TIJWR0wzvTk{ display:none !important; }"
			
			# "title" = "Dynamic Search Bar";
			# "description" = "Make the search bar dynamic, so it only shows when you hover over it.";
			":root {\n  margin-top: -16px;\n}\n#global-nav-bar {\n  position: absolute;\n  width: calc(100% + 16px);\n  background: none;\n  opacity: 0;\n  z-index: 12;\n  top: 16px;\n  transition: opacity 0.3s ease-in-out;\n}\n#global-nav-bar:hover {\n  z-index: 12;\n  opacity: 1;\n}\n.Root__now-playing-bar {\n  transform: translateY(16px);\n}\naside[aria-label=\"Now playing bar\"] {\n  transform: translateY(-8px);\n}\n.Root__globalNav .main-globalNav-navLink {\n  background: none;\n}\n.e_N7UqrrJQ0fAw9IkNAL {\n  padding-top: 56px;\n}\n.marketplace-tabBar, .marketplace-tabBar-nav {\n  padding-top: 48px;\n}\n.marketplace-header {\n  padding-top: 16px;\n}\n.marketplace-header__left {\n  padding-top: 16px;\n}\n.main-topBar-background {\n  background-color: #121212;\n}\n.liw6Y_iPu2DJRwk10x9d .FLyfurPaIDAlwjsF3mLf{\n  display: none;\n}"

			# "title" = "Hide download button";
			# "description" = "Hide download button in EPs and albums";
			".x-downloadButton-DownloadButton { display: none; }"

			# "title" = "Hide lyrics button";
			# "description" = "Hides the lyrics button in the playbar";
			".main-nowPlayingBar-lyricsButton { display: none; }"

			# "title" = "Hide Mini Player Button";
			# "description" = "Hides the Mini Player button.";
			"button:has(path[d='M16 2.45c0-.8-.65-1.45-1.45-1.45H1.45C.65 1 0 1.65 0 2.45v11.1C0 14.35.65 15 1.45 15h5.557v-1.5H1.5v-11h13V7H16V2.45z']), button:has(path[d='M16 2.45c0-.8-.65-1.45-1.45-1.45H1.45C.65 1 0 1.65 0 2.45v11.1C0 14.35.65 15 1.45 15h5.557v-1.5H1.5v-11h13V7H16z']) {display: none;}"

			# "title" = "Modern ScrollBar";
			# "description" = "Thin rounded modern scrollbar";
			".os-scrollbar-handle { width:0.25rem!important;border-radius:10rem !important; transition: width 300ms ease-in-out; } .os-scrollbar-handle:focus,.os-scrollbar-handle:focus-within,.os-scrollbar-handle:hover { width:0.35rem!important }"
		];
		theme = spicePkgs.themes.text;
	};
}

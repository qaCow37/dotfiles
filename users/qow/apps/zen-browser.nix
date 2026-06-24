{lib, config, pkgs, inputs, system, ...}:
{
	programs.zen-browser = {
		enable = true;
		setAsDefaultBrowser = true;
		policies = {
			AutofillAddressEnabled = false;
			AutofillCreditCardEnabled = false;
			DisableAppUpdate = true;
			DisableFeedbackCommands = true;
			DisableFirefoxStudies = true;
			DisablePocket = true;
			DisableTelemetry = true;
			DontCheckDefaultBrowser = true;
			NoDefaultBookmakrs = true;
			OfferToSaveLogins = false;
			EnableTrackingProtection = {
				Value = true;
				Locked = true;
				Cryptomining = true;
				Fingerprinting = true;
			};
			PictureInPicture = false;
			SearchSuggestEnabled = false;
			TranslateEnabled = false;
			SearchEngines = {
				HideDefaultSearchEngines = true;
				Default = "brave";
				PreventInstalls = true;
			};
		};
	};
	programs.zen-browser.policies.Preferences = {
		"browser.aboutConfig.showWarning" = {
			Value = false;
			Status = "locked";
		};
	};
	programs.zen-browser.profiles.default = {
		search = {
			force = true;
			default = "brave";
			engines = {
				"brave" = {
					name = "Brave";
					urls = [
						{
							template = "https://search.brave.com/search?q={searchTerms}";
						}
					];
				};
				"mynixos" = {
					name = "My NixOS";
					urls = [
						{
							template = "https://mynixos.com/search?q={searchTerms}";
						}
					];
					definedAliases = ["@nix"];
				};
				"steamdb" = {
					name = "SteamDB";
					urls = [
						{
							template = "https://steamdb.info/search/?q={searchTerms}";
						}
					];
					definedAliases = ["@steam"];
				};
				"protondb" = {
					name = "ProtonDB";
					urls = [
						{
							template = "https://www.protondb.com/search?q={searchTerms}";
						}
					];
					definedAliases = ["@proton"];
				};
				"reddit" = {
					name = "Reddit";
					urls = [
						{
							template = "https://www.reddit.com/search/?q={searchTerms}";
						}
					];
					definedAliases = ["reddit"];
				};
			};
		};
		settings = {
			# Layout to Sidebar + Toolbar
			"zen.view.use-single-toolbar" = false;
			"zen.view.sidebar-expanded" = true;
			"zen.view.sidebar-expanded.max-width" = 400;

			"layout.spellcheckDefault" = 0;
			"zen.workspaces.continue-where-left-off" = true;
			"zen.welcome-screen.seen" = true;
			"media.videocontrols.picture-in-picture.video-toggle.enabled" = false;

			# Privacy
			"privacy.resistFingerprinting" = true;

			# Required by Mod or Extension
			"zen.urlbar.replace-newtab" = false; # Bonjour

			 # Search Suggestions
			"browser.urlbar.suggest.addons" = false;
			"browser.urlbar.suggest.openpage" = false;
			"browser.urlbar.suggest.recentsearches" = false;
			"browser.urlbar.suggest.clipboard" = false;
			"browser.urlbar.suggest.engines" = false;
			"browser.urlbar.suggest.history" = false;
			"browser.urlbar.suggest.mdn" = false;
			"browser.urlbar.suggest.quickactions" = false;
			"browser.urlbar.suggest.trending" = false;
			"browser.urlbar.suggest.sports" = false;
			"browser.urlbar.suggest.weather" = false;
			"browser.urlbar.suggest.wikipedia" = false;
			"browser.urlbar.suggest.yelp" = false;
		};
		extensions.packages = with inputs.firefox-addons.packages.${system}; [
			ublock-origin
			zen-internet
			bonjourr-startpage
			vimium
		];
		mods = [
			# Transparent-Zen
			"642854b5-88b4-4c40-b256-e035532109df"
		];
		bookmarks = {
			force = true;
			settings = [
				{
					name = "Other";
					bookmarks = [
						{
							name = "KeyBR";
							url = "https://keybr.com";
							tags = ["typing" "game"];
						}
					];
				}
				{
					name = "Satisfactory";
					bookmarks = [
						{
							name = "SatisfactoryCalc";
							url = "https://satisfactory-calculator.com";
							tags = ["satisfactory" "satisfactory-calc"];
						}
						{
							name = "SatisfactoryMap";
							url = "https://satisfactory-calculator.com/interactive-map";
							tags = ["satisfactory" "satisfactory-calc"];
						}						{
							name = "SatisfactoryRanking";
							url = "https://reddit.com/r/SatisfactoryGame/comments/1ff515j/alternate_recipe_ranking_10_optimizing_for";
							tags = ["satisfactory" "satisfactory-rank"];
						}
					];
				}
				{
					name = "SocialMedia";
					bookmarks = [
						{
							name = "Reddit";
							url = "https://reddit.com";
							tags = ["social"];
						}
						{
							name = "Pixiv";
							url = "https://pixiv.net";
							tags = ["social"];
						}
						{
							name = "Youtube";
							url = "https://youtube.com";
							tags = ["social"];
						}
					];
				}
				{
					name = "Services";
					bookmarks = [
						{
							name = "Proton";
							url = "https://proton.me";
							tags = ["service" "proton"];
						}
						{
							name = "ProtonPass";
							url = "https://pass.proton.me";
							tags = ["service" "proton"];
						}
						{
							name = "ProtonMail";
							url = "https://mail.proton.me";
							tags = ["service" "mail" "proton"];
						}
						{
							name = "AtomicMail";
							url = "https://atomicmail.io";
							tags = ["service" "mail"];
						}
						{
							name = "GitHub";
							url = "https://github.com";
							tags = ["service"];
						}
					];
				}
				{
					name = "Tools";
					bookmarks = [
						{
							name = "BraveAI";
							url = "https://search.brave.com/ask";
							tags = ["tool" "ai"];
						}
						{
							name = "ChatGPT";
							url = "https://chatgpt.com";
							tags = ["tool" "ai"];
						}
						{
							name = "DeepL";
							url = "https://deepl.com";
							tags = ["tool" "translator"];
						}
					];
				}
				{
					name = "Info";
					bookmarks = [
						{
							name = "SteamDB";
							url = "https://steamdb.info";
							tags = ["info" "db"];
						}
						{
							name = "ProtonDB";
							url = "https://protondb.com";
							tags = ["info" "db"];
						}
						{
							name = "HyprWiki";
							url = "https://wiki.hypr.land";
							tags = ["info" "wiki"];
						}
					];
				}
			];
		};

		keyboardShortcuts = let
			all-items = [
				# Generated with:
				# jq -c '.shortcuts[] | {id, key, keycode, action}' ~/.config/zen/default/zen-keyboard-shortcuts.json | grep -oP '(?<="id":)"[^"]*"'
				"key_wrToggleCaptureSequenceCmd"
				"key_wrCaptureCmd"
				"key_selectLastTab"
				"key_selectTab8"
				"key_selectTab7"
				"key_selectTab6"
				"key_selectTab5"
				"key_selectTab4"
				"key_selectTab3"
				"key_selectTab2"
				"key_selectTab1"
				"key_duplicateTab"
				"key_undoCloseWindow"
				"key_restoreLastClosedTabOrWindowOrSession"
				"key_quitApplication"
				"key_sanitize"
				"key_screenshot"
				"key_privatebrowsing"
				"key_switchTextDirection"
				"key_showAllTabs"
				"key_fullZoomReset"
				"key_fullZoomEnlarge"
				"key_fullZoomReduce"
				"key_gotoHistory"
				"toggleSidebarKb"
				"viewGenaiChatSidebarKb"
				"key_stop"
				"viewBookmarksToolbarKb"
				"viewBookmarksSidebarKb"
				"manBookmarkKb"
				"bookmarkAllTabsKb"
				"addBookmarkAsKb"
				"key_findPrevious"
				"key_findAgain"
				"key_find"
				"key_viewInfo"
				"key_viewSource"
				"key_aboutProcesses"
				"key_reload_skip_cache"
				"key_reload"
				"key_togglePictureInPicture"
				"key_toggleReaderMode"
				"key_exitFullScreen"
				"key_enterFullScreen"
				"key_reload_skip_cache2"
				"showAllHistoryKb"
				"key_reload2"
				"goHome"
				"goForwardKb2"
				"goBackKb2"
				"goForwardKb"
				"goBackKb"
				"key_selectAll"
				"key_delete"
				"key_paste"
				"key_copy"
				"key_cut"
				"key_redo"
				"key_undo"
				"key_toggleMute"
				"key_closeWindow"
				"key_close"
				"printKb"
				"key_savePage"
				"openFileKb"
				"key_openAddons"
				"key_openDownloads"
				"key_search2"
				"key_search"
				"focusURLBar2"
				"focusURLBar"
				"key_newNavigatorTab"
				"key_newNavigator"
				"zen-compact-mode-toggle"
				"zen-compact-mode-show-sidebar"
				"zen-workspace-switch-10"
				"zen-workspace-switch-9"
				"zen-workspace-switch-8"
				"zen-workspace-switch-7"
				"zen-workspace-switch-6"
				"zen-workspace-switch-5"
				"zen-workspace-switch-4"
				"zen-workspace-switch-3"
				"zen-workspace-switch-2"
				"zen-workspace-switch-1"
				"zen-workspace-forward"
				"zen-workspace-backward"
				"zen-split-view-grid"
				"zen-split-view-vertical"
				"zen-split-view-horizontal"
				"zen-split-view-unsplit"
				"zen-pinned-tab-reset-shortcut"
				"zen-toggle-sidebar"
				"zen-copy-url"
				"zen-copy-url-markdown"
				"zen-toggle-pin-tab"
				"zen-glance-expand"
				"zen-new-empty-split-view"
				"zen-close-all-unpinned-tabs"
				"zen-new-unsynced-window"
				"zen-duplicate-tab"
				"zen-workspace-create"
				"key_accessibility"
				"key_dom"
				"key_storage"
				"key_performance"
				"key_styleeditor"
				"key_netmonitor"
				"key_jsdebugger"
				"key_webconsole"
				"key_inspector"
				"key_responsiveDesignMode"
				"key_browserConsole"
				"key_browserToolbox"
				"key_toggleToolbox"
			];
			keybinds = [
				{
					id = "key_newNavigatorTab";
					key = "t";
					modifiers.control = true;
				}
				{
					id = "focusURLBar";
					key = "l";
					modifiers.control = true;
				}
				{
					id = "zen-close-all-unpinned-tabs";
					key = "u";
					modifiers.control = true;
				}
			];
		# Disables all Shortcuts and only keeps the ones defined in `keybinds`:
		#
		# Go through all items,
		# if an item with the same `id` was not found in `keybinds`
		# then generate a shortcut that disabled any binding with that id
		# else use the items from keybindings
		in map (id:
			let
				# Find last element with same id `id` in `keybinds`
				# if not found `bind` is equal to null
				bind = lib.lists.findFirst (item:
					item.id == id
				) null keybinds;
			in if bind == null
				then {
					id = id;
					disabled = true;
				}
				else bind
		) all-items;
		keyboardShortcutsVersion = 19;

		spaces = {
			"Personal" = {
				id = "f6ee1c39-172c-5370-2b11-320409caf2db";
				position = 1000;
				/*theme = {
					type = "gradient";
					colors = [
						{
							red = 50;
							green = 50;
							blue = 50;
							algorithm = "floating";
							type = "explicit-lightness";
							lightness = 0;
						}
					];
					opacity = 0.0;
					texture = 0.0;
				};*/
			};
		};
		spacesForce = true;
	};
}

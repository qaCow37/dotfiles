{lib, ...}:
{
	programs.zen-browser.profiles.default.keyboardShortcuts =
	let
		keybinds = [
			{
				id = "key_newNavigatorTab";
				key = "t";
				modifiers.alt = true;
			}
			{
				id = "key_close";
				key = "u";
				modifiers.alt = true;
			}
			{
				id = "focusURLBar";
				key = "q";
				modifiers.alt = true;
			}
		];

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
}

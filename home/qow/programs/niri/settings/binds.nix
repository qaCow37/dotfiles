{config, lib, pkgs, ...}:
{
	programs.niri.settings.binds =
	let
		cmd = {
			jq        = "${lib.getExe pkgs.jq}";
			niri      = "${config.programs.niri.package}/bin/niri";
			playerctl = "${config.services.playerctld.package}/bin/playerctl";
			wpctl     = "${pkgs.wireplumber}/bin/wpctl";
		};
	in
	{
		"Mod+T" = {
			action.spawn = "kitty";
			repeat = false;
		};
		
		"Mod+H"     .action.focus-column-left             = [];
		"Mod+L"     .action.focus-column-right            = [];
		"Mod+J"     .action.focus-workspace-down          = [];
		"Mod+K"     .action.focus-workspace-up            = [];
		"Mod+Ctrl+H".action.move-column-left              = [];
		"Mod+Ctrl+L".action.move-column-right             = [];
		"Mod+Ctrl+J".action.move-column-to-workspace-down = [];
		"Mod+Ctrl+K".action.move-column-to-workspace-up   = [];
		"Mod+M"     .action.switch-preset-column-width    = [];

		"Mod+N".action.focus-monitor-next = [];
		"Mod+Ctrl+N".action.move-column-to-monitor-next = [];

		"Mod+U" = {
			action.close-window = [];
			repeat = false;
		};
		"Mod+Shift+U" = {
			action.spawn-sh =
			''
				kill -9 "$(
					${cmd.niri} msg -j focused-window | ${cmd.jq} -r '.pid'
				)"
			'';
			repeat = false;
		};

		"XF86AudioPlay".action.spawn = [cmd.playerctl "play-pause"];
		"XF86AudioStop".action.spawn = [cmd.playerctl "stop"];
		"XF86AudioNext".action.spawn = [cmd.playerctl "next"];
		"XF86AudioPrev".action.spawn = [cmd.playerctl "previous"];
		"XF86AudioRaiseVolume"     .action.spawn = [cmd.wpctl "set-volume" "@DEFAULT_AUDIO_SINK@" "0.10+"];
		"XF86AudioLowerVolume"     .action.spawn = [cmd.wpctl "set-volume" "@DEFAULT_AUDIO_SINK@" "0.10-"];
		"CTRL+XF86AudioRaiseVolume".action.spawn = [cmd.wpctl "set-volume" "@DEFAULT_AUDIO_SINK@" "0.05+"];
		"CTRL+XF86AudioLowerVolume".action.spawn = [cmd.wpctl "set-volume" "@DEFAULT_AUDIO_SINK@" "0.05-"];
	};
}

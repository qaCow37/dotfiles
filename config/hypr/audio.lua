local mod = {}

function mod.conf()
	local locked = {locked=true}
	local locked_rep = {locked=true,repeating=true}

	hl.bind(     "XF86AudioRaiseVolume", hl.dsp.exec_cmd("wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 5%+")   , locked_rep)
	hl.bind(     "XF86AudioLowerVolume", hl.dsp.exec_cmd("wpctl set-volume      @DEFAULT_AUDIO_SINK@ 5%-")   , locked_rep)
	hl.bind("CTRL+XF86AudioRaiseVolume", hl.dsp.exec_cmd("wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 2%+")   , locked_rep)
	hl.bind("CTRL+XF86AudioLowerVolume", hl.dsp.exec_cmd("wpctl set-volume      @DEFAULT_AUDIO_SINK@ 2%-")   , locked_rep)
	hl.bind("XF86AudioMute"            , hl.dsp.exec_cmd("wpctl set-mute        @DEFAULT_AUDIO_SINK@ toggle"), locked_rep)
	hl.bind("XF86AudioNext"            , hl.dsp.exec_cmd("playerctl next"),       locked)
	hl.bind("XF86AudioPause"           , hl.dsp.exec_cmd("playerctl play-pause"), locked)
	hl.bind("XF86AudioPlay"            , hl.dsp.exec_cmd("playerctl play-pause"), locked)
	hl.bind("XF86AudioPrev"            , hl.dsp.exec_cmd("playerctl previous"),   locked)
end

return mod

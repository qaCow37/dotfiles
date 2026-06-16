hl.config({
	input = {
		repeat_delay = 230,
		repeat_rate = 40,
		follow_mouse = 0,
	},
	cursor = {
		hide_on_key_press = true,
	},
})

hl.bind("SUPER+T" , hl.dsp.exec_cmd("kitty"))
hl.bind("SUPER+F4", hl.dsp.window.close())
hl.bind("SUPER+SHIFT+F4", hl.dsp.window.kill())

local workspace = {
	dsp_prev = hl.dsp.focus({
		workspace = "m-1"
	}),
	dsp_next = hl.dsp.focus({
		workspace = "m+1"
	}),
	dsp_new = hl.dsp.focus({
		workspace = "r+1"
	}),
}
function workspace.prev()
	local cur = hl.get_active_workspace()
	if cur ~= nil then
		local next = hl.get_workspace("m-1")
		if next ~= nil and next.id < cur.id then
			hl.dispatch(workspace.dsp_prev)
		end
	end
end
function workspace.next()
	local cur = hl.get_active_workspace()
	if cur ~= nil then
		local win = hl.get_workspace_windows(cur.id)
		local next = hl.get_workspace("m+1")
		if next ~= nil and #win > 0 then
			hl.dispatch((next.id > cur.id)
				and workspace.dsp_next
				or  workspace.dsp_new
			)
		end
	end
end

hl.bind("SUPER+H", hl.dsp.layout("focus l"), {repeating=true})
hl.bind("SUPER+L", hl.dsp.layout("focus r"), {repeating=true})
hl.bind("SUPER+M", hl.dsp.layout("colresize +conf"))
hl.bind("SUPER+J", workspace.next, {repeating=true})
hl.bind("SUPER+K", workspace.prev, {repeating=true})

-- Audio
hl.bind("XF86AudioPlay"            , hl.dsp.exec_cmd("playerctl play-pause"))
hl.bind("XF86AudioStop"            , hl.dsp.exec_cmd("playerctl stop"      ))
hl.bind("XF86AudioNext"            , hl.dsp.exec_cmd("playerctl next"      ))
hl.bind("XF86AudioPrev"            , hl.dsp.exec_cmd("playerctl previous"  ))
hl.bind("XF86AudioRaiseVolume"     , hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SINK@ 0.05+"))
hl.bind("XF86AudioLowerVolume"     , hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SINK@ 0.05-"))
hl.bind("CTRL+XF86AudioRaiseVolume", hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SINK@ 0.02+"))
hl.bind("CTRL+XF86AudioLowerVolume", hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SINK@ 0.02-"))

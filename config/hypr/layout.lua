local mod = {}

function mod.conf()
	hl.config({
		general = {
			layout = "dwindle",
		},
		scrolling = {
			direction = "right",
			fullscreen_on_one_column = true,
		},
	})

	hl.workspace_rule({
                workspace = "1",
                monitor = "DP-1",
                layout = "scrolling",
        })
end

return mod

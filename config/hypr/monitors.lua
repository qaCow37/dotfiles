local mod = {}

function mod.conf()
	hl.monitor({
		output = "DP-1",
		mode = "2560x1440@240",
		position = "1280x1080",
		scale = 1.0,
	})
	hl.monitor({
		output = "DP-2",
		mode = "1920x1080@144",
		position = "720x0",
		scale = 1.0,
	})
	hl.monitor({
		output = "DP-3",
		mode = "1280x1024@60",
		position = "0x1080",
		scale = 1.0,
	})
end

return mod

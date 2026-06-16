hl.config({
	decoration = {
		blur = {
			enabled = true,
			size = 8,
			passes = 5,
			contrast = 1.0,
			brightness = 1.0,
			vibrancy = 0.0,
		},
		rounding = 15,
		shadow = {enabled=false},
		glow   = {enabled=false},
	}
})

hl.animation({
	leaf = "fade",
	enabled = false,
})
hl.animation({
	leaf = "border",
	enabled = false,
})

hl.curve("workspace-windows", {
	type = "spring",
	mass = 1,
	stiffness = 100,
	dampening = 17.6,
})
hl.animation({
	leaf = "workspaces",
	enabled = true,
	speed = 1,
	spring = "workspace-windows",
	style = "slidevert"
})
hl.animation({
	leaf = "windows",
	enabled = true,
	speed = 1,
	spring = "workspace-windows",
})

hl.curve("window-in-out", {
	type = "bezier",
	points = {
		{0.9, 0.7},
		{1  , 1  },
	},
})
hl.animation({
	leaf = "windowsIn",
	enabled = true,
	speed = 1.2,
	bezier = "window-in-out",
	style = "slide top",
})
hl.animation({
	leaf = "windowsOut",
	enabled = true,
	speed = 1,
	bezier = "window-in-out",
	style = "slide top",
})

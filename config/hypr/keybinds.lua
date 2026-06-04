local mod = {}

function mod.conf()
	hl.bind("ALT         + F4", hl.dsp.window.close())
	hl.bind("ALT + SHIFT + F4", hl.dsp.window.kill())
end

return mod

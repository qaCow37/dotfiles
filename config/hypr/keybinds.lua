local mod = {}

function mod.conf()
	hl.bind("CTRL + ALT + T"  , hl.dsp.exec("kitty"))
	hl.bind("ALT         + F4", hl.dsp.window.close())
	hl.bind("ALT + SHIFT + F4", hl.dsp.window.kill())
end

return mod

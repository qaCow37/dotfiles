local mod = {}

function mod.conf()
	local repeating = {repeating=true}
	-- prevent menu from sending signal to focused apps
	hl.bind("CTRL+MENU"            , hl.dsp.no_op())
	hl.bind("SUPER+MENU"           , hl.dsp.no_op())
	hl.bind("CTRL+SUPER+MENU"      , hl.dsp.no_op())
	hl.bind("SUPER+UP"             , hl.dsp.focus({direction="u"}))
	hl.bind("SUPER+LEFT"           , hl.dsp.focus({direction="l"}))
	hl.bind("SUPER+DOWN"           , hl.dsp.focus({direction="d"}))
	hl.bind("SUPER+RIGHT"          , hl.dsp.focus({direction="r"}))
	hl.bind("SUPER+MENU+UP"        , hl.dsp.focus({monitor="u"}))
	hl.bind("SUPER+MENU+LEFT"      , hl.dsp.focus({monitor="l"}))
	hl.bind("SUPER+MENU+DOWN"      , hl.dsp.focus({monitor="d"}))
	hl.bind("SUPER+MENU+RIGHT"     , hl.dsp.focus({monitor="r"}))
	hl.bind("SUPER+CTRL+UP"        , hl.dsp.window.move({direction="u"}))
	hl.bind("SUPER+CTRL+LEFT"      , hl.dsp.window.move({direction="l"}))
	hl.bind("SUPER+CTRL+DOWN"      , hl.dsp.window.move({direction="d"}))
	hl.bind("SUPER+CTRL+RIGHT"     , hl.dsp.window.move({direction="r"}))
	hl.bind("SUPER+CTRL+MENU+UP"   , hl.dsp.window.move({monitor="u"}))
	hl.bind("SUPER+CTRL+MENU+LEFT" , hl.dsp.window.move({monitor="l"}))
	hl.bind("SUPER+CTRL+MENU+DOWN" , hl.dsp.window.move({monitor="d"}))
	hl.bind("SUPER+CTRL+MENU+RIGHT", hl.dsp.window.move({monitor="r"}))
	hl.bind("SUPER+ALT+UP"         , hl.dsp.window.resize({y=-50  ,x=0,relative=true}), repeating)
	hl.bind("SUPER+ALT+LEFT"       , hl.dsp.window.resize({x=-50  ,y=0,relative=true}), repeating)
	hl.bind("SUPER+ALT+DOWN"       , hl.dsp.window.resize({y= 50  ,x=0,relative=true}), repeating)
	hl.bind("SUPER+ALT+RIGHT"      , hl.dsp.window.resize({x= 50  ,y=0,relative=true}), repeating)
	hl.bind("SUPER+ALT+CTRL+UP"    , hl.dsp.window.resize({y=-1000,x=0,relative=true}), repeating)
	hl.bind("SUPER+ALT+CTRL+LEFT"  , hl.dsp.window.resize({x=-1000,y=0,relative=true}), repeating)
	hl.bind("SUPER+ALT+CTRL+DOWN"  , hl.dsp.window.resize({y= 1000,x=0,relative=true}), repeating)
	hl.bind("SUPER+ALT+CTRL+RIGHT" , hl.dsp.window.resize({x= 1000,y=0,relative=true}), repeating)

	hl.bind("CTRL + ALT + T"    , hl.dsp.exec_cmd("kitty"))
	hl.bind("SUPER         + F4", hl.dsp.window.close())
	hl.bind("SUPER + SHIFT + F4", hl.dsp.window.kill())
end

return mod

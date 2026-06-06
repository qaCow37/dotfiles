local mod = {}

function mod.overlap_guard()
	local n = false
	return function(dsp, default)
		if default == true then
			return function()
				if n == false then
					hl.dispatch(dsp)
				end
				n = false
			end
		else
			return function()
				hl.dispatch(dsp)
				n = true
			end
		end
	end
end

function mod.conf()
	hl.bind("SUPER_L", hl.dsp.submap("overview"))
	hl.define_submap("overview", function()
		local guard = mod.overlap_guard()
		hl.bind("SPACE + UP"   , guard(hl.dsp.window.move({direction="u"})))
		hl.bind("SPACE + LEFT" , guard(hl.dsp.window.move({direction="l"})))
		hl.bind("SPACE + DOWN" , guard(hl.dsp.window.move({direction="d"})))
		hl.bind("SPACE + RIGHT", guard(hl.dsp.window.move({direction="r"})))
		hl.bind("UP"           , guard(hl.dsp.focus({direction="u"}), true))
		hl.bind("LEFT"         , guard(hl.dsp.focus({direction="l"}), true))
		hl.bind("DOWN"         , guard(hl.dsp.focus({direction="d"}), true))
		hl.bind("RIGHT"        , guard(hl.dsp.focus({direction="r"}), true))
		hl.bind("SHIFT + UP"   , hl.dsp.window.resize({x=  0,y=-50,relative=true}), {repeating=true})
		hl.bind("SHIFT + LEFT" , hl.dsp.window.resize({x=-50,y=  0,relative=true}), {repeating=true})
		hl.bind("SHIFT + DOWN" , hl.dsp.window.resize({x=  0,y= 50,relative=true}), {repeating=true})
		hl.bind("SHIFT + RIGHT", hl.dsp.window.resize({x= 50,y=  0,relative=true}), {repeating=true})

		local function swap_monitor(dir)
			return function()
				local src = hl.get_active_monitor()
				hl.dispatch(hl.dsp.focus({monitor=dir}))
				local dst = hl.get_active_monitor()
				hl.dispatch(hl.dsp.workspace.swap_monitors({
					monitor1 = src,
					monitor2 = dst,
				}))
			end
		end

		hl.bind("CTRL + SPACE + UP"   , swap_monitor("u"))
		hl.bind("CTRL + SPACE + LEFT" , swap_monitor("l"))
		hl.bind("CTRL + SPACE + DOWN" , swap_monitor("d"))
		hl.bind("CTRL + SPACE + RIGHT", swap_monitor("r"))
		-- FixMe CTRL closed overview before binds could get executed

		hl.bind("SPACE"  , hl.dsp.no_op())
		hl.bind("SHIFT_L", hl.dsp.no_op())
		hl.bind("SHIFT_R", hl.dsp.no_op())

		local function reset()
			hl.dispatch(hl.dsp.submap("reset"))
		end

		local non_consuming = {non_consuming=true}
		hl.bind("ESCAPE"   , reset)
		hl.bind("RETURN"   , reset)
		hl.bind("SUPER"    , reset)
		hl.bind("catchall" , reset, non_consuming)
		hl.bind("mouse:272", reset, non_consuming)
		hl.bind("mouse:273", reset, non_consuming)
		hl.bind("mouse:274", reset, non_consuming)
		hl.bind("mouse:275", reset, non_consuming)
		hl.bind("mouse:276", reset, non_consuming)
	end)

	local universal = {submap_universal=true}
	hl.bind("CTRL + ALT + T"  , hl.dsp.exec_cmd("kitty"), universal)
	hl.bind("ALT         + F4", hl.dsp.window.close()   , universal)
	hl.bind("ALT + SHIFT + F4", hl.dsp.window.kill()    , universal)
end

return mod

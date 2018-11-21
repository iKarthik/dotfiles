local mod = {}



function fancyNotify(t,m)
     hs.notify.new({title=t, informativeText=m}):send():release()
end

function mod.init()
	--[ hourly alarm ]----------------------------------------------------------
	hs.timer.doAt("0:00","1h", function() hs.alert("Ding Dong") end)


	local menu_bar = hs.menubar.new()
	menu_bar:setTitle("¯\\_(ツ)_/¯")
	hs.timer.doAt("0:00","1m", function() 
		local d = hs.execute("/Users/sduff/bin/osx-cpu-temp -f"):gsub("[\r\n]","")
		menu_bar:setTitle(d)
	end)

	hs.hotkey.bind(hyper, '8', hs.hints.windowHints)

	fancyNotify("Hammertime","Captain Hammer!")

end

return mod
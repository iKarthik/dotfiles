local mod = {}
local log = hs.logger.new('mymodule','debug')


function callAndCenter(functionToCall)
	functionToCall()
	spoon.WinWin:centerCursor()
end

function halfLeft()
	spoon.WinWin:moveAndResize("halfleft")
	spoon.WinWin:centerCursor()
end

function cornerNW()
	spoon.WinWin:moveAndResize("cornerNW")
end

function cornerNE()
	spoon.WinWin:moveAndResize("cornerNE")
end

function cornerSW()
	spoon.WinWin:moveAndResize("cornerSW")
end

function cornerSE()
	spoon.WinWin:moveAndResize("cornerSE")
end

function halfRight()
	spoon.WinWin:moveAndResize("halfright")
end

function halfUp()
	spoon.WinWin:moveAndResize("halfup")
end

function halfDown()
	spoon.WinWin:moveAndResize("halfdown")
end

function fullScreen()
	spoon.WinWin:moveAndResize("fullscreen")
end

function center()
	spoon.WinWin:moveAndResize("center")
end

function shrink()
	spoon.WinWin:moveAndResize("shrink")
end

function expand()
	spoon.WinWin:moveAndResize("expand")
end

function toggleMinimize()
 	appwindow = hs.window.focusedWindow()

 	if not appwindow then 
 		appwindow = hs.window.frontmostWindow()
 	end

 	if appwindow:isMinimized() then
 		appwindow:unminimize()
 	else
 		appwindow:minimize()
 	end
end

function cycle(hyper)
	hs.hotkey.bind(hyper, ";", function() hs.fnutils.map(hs.window.visibleWindows(), hs.grid.snap) end)
	hs.hotkey.bind(hyper, '[', function() hs.window.focusedWindow():focusWindowWest() end)
	hs.hotkey.bind(hyper, ']', function() hs.window.focusedWindow():focusWindowEast() end)
	hs.hotkey.bind(shyper, '[', function() hs.window.focusedWindow():focusWindowNorth() end)
	hs.hotkey.bind(shyper, ']', function() hs.window.focusedWindow():focusWindowSouth() end)


end


function auto_tile(appName, event)
	if event == hs.application.watcher.launched then
		local app = hs.appfinder.appFromName(appName)
		-- protect against unexpected restarting windows
		if app == nil then
			return
		end
		hs.fnutils.map(app:allWindows(), hs.grid.snap)
	end
end

function bindKeys(hyper, shyper)
	hs.hotkey.bind(hyper, "left", (halfLeft))
	hs.hotkey.bind(hyper, "right", (halfRight))
	hs.hotkey.bind(hyper, "up", (halfUp))
	hs.hotkey.bind(hyper, "down", (halfDown))
	hs.hotkey.bind(hyper, "return", (fullScreen))
	hs.hotkey.bind(hyper, "=", (expand))

	hs.hotkey.bind(shyper, "left", (cornerNW))
	hs.hotkey.bind(shyper, "right", (cornerNE))
	hs.hotkey.bind(shyper, "up", (cornerSW))
	hs.hotkey.bind(shyper, "down", (cornerSE))
	hs.hotkey.bind(shyper, "return", (center))
	hs.hotkey.bind(shyper, "=", (shrink))


	hs.hotkey.bind(hyper, "m", toggleMinimize)
	-- hs.hotkey.bind(hyper, "n", maximizeWindow)
end

function mod.init(hyper, shyper)
	hs.application.watcher.new(auto_tile):start()
	bindKeys(hyper, shyper)
	cycle(hyper)
end

return mod
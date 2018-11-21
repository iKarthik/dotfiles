local mod = {}
local log = hs.logger.new('mymodule','debug')
local fnutils = require "hs.fnutils"


function execute()
	hs.application.launchOrFocus("Google Chrome")
	result, object, descriptor = hs.osascript.applescriptFromFile("~/.hammerspoon//executeAs.applescript", "AppleScript")
		    log.i(object)
	if object == false then
	    log.i("could not find it")
		openMail()
	end
end

function openMail()
	app = hs.application.open("Google Chrome")
	app:selectMenuItem({"File","New Tab"}) 
	hs.eventtap.keyStrokes("https://mail.google.com/mail/u/?authuser=kbalasub@gmail.com")
	hs.eventtap.event.newKeyEvent("return", true):post()
end

function realWindow(win)
  -- AXScrollArea is weird role of special finder desktop window
  return (win:isStandard() and win:role() ~= "AXScrollArea")
end

function tabWindows(app)
  local tabWins = fnutils.filter(app:allWindows(),realWindow)
  table.sort(tabWins, function(a,b) return a:title() < b:title() end)
  return tabWins
end

-- function tabsInChrome()
-- 	app = hs.application.get("Google Chrome")
-- 	hs.tabs.enableForApp(app)
-- 	tabs = hs.tabs.tabWindows(app)
-- 	local numTabs = #tabs
-- 	hs.window:focusTab(2)

-- 	log.i(numTabs)
-- end


function mod.init(hyper)
	hs.allowAppleScript(true)
	hs.hotkey.bind(hyper, 'x', execute)
end

return mod
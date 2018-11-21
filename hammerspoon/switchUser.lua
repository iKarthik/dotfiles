local mod = {}
local log = hs.logger.new('mymodule','debug')
local fnutils = require "hs.fnutils"


function execute()
	result, object, descriptor = hs.osascript.applescriptFromFile(os.getenv ("HOME") .. "/.hammerspoon/switchUser.applescript")
	log.i("Switched i hope there")
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


function mod.init(hyper, shyper)
	hs.allowAppleScript(true)
	hs.hotkey.bind(hyper, 'x', execute)
end

return mod
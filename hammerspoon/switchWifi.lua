local mod = {}
local log = hs.logger.new('wifimodule','debug')
local fnutils = require "hs.fnutils"


function changeWifi()
	result, object, descriptor = hs.osascript.applescriptFromFile(os.getenv ("HOME") .. "/.hammerspoon/switchWifi.applescript")
	log.i("Changed wifi there..")
end



function mod.init(hyper, shyper)
	hs.allowAppleScript(true)
	hs.hotkey.bind(hyper, 'w', changeWifi)
end

return mod
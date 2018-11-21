
local mod = {}


function chrome()
	app = hs.application.launchOrFocus("Google Chrome")
end

function terminal()
	hs.application.launchOrFocus("Terminal")
end

function finder()
	app = hs.application.launchOrFocus("Finder")
end

function sublime()
	hs.application.launchOrFocus("Sublime Text")
end


function mod.init(hyper)
	hs.hotkey.bind(hyper, 'c', chrome)
	hs.hotkey.bind(hyper, 't', terminal)
	hs.hotkey.bind(hyper, 'f', finder)
	hs.hotkey.bind(hyper, 's', sublime)	
end

return mod
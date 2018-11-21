local mod = {}


function mod.init(hyper)
	hs.hotkey.bind(hyper, 'L', function() hs.caffeinate.startScreensaver() end)
end

return mod
local mod = {}


function applicationWatcher(appName, eventType, appObject)
    if (eventType == hs.application.watcher.activated) then
        if (appName == "Google Chrome") then
            	-- do something here, when Chrome launches
        end
    end
end

function mod.init()
	local appWatcher = hs.application.watcher.new(applicationWatcher)
    appWatcher:start()
end

return mod
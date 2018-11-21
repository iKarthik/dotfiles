
hs.loadSpoon("SpoonInstall")
Install=spoon.SpoonInstall

local mod = {}

-- function halfLeft()
-- 	log.i(spoon.WinWin)
-- 	spoon.WinWin:stepMove("left")
-- end

function mod.init(hyper)
	--Reload hammerspoon configs----------------------------------------------------------
	Install:andUse("ReloadConfiguration",
               {
                 config = { auto_reload_config = false },
                 hotkeys = {
                   reloadConfiguration = {hyper, "r"}
                 },
                 start = true
               })

	---WindowScreen----------------------------------------------------------
	Install:andUse("WindowScreenLeftAndRight",
	               {
	                 hotkeys = {
	                    screen_left = { hyper, "9" },
    					screen_right= { hyper, "0" },
	                 }
	               })

	--Caffeine----------------------------------------------------------
	Install:andUse("Caffeine", {
	                 start = true,
	                 hotkeys = {
	                   toggle = { hyper, "1" }
	                 }
	})

	--Clipboard----------------------------------------------------------
	Install:andUse("TextClipboardHistory",
	               {
	                 config = {
	                   show_in_menubar = false,
	                 },
	                 hotkeys = {
	                   toggle_clipboard = { hyper, "v" } },
	                 start = true,
	               })

		--Clipboard----------------------------------------------------------
	 Install:andUse("WinWin", {})

	 -- hs.hotkey.bind(hyper, "left", halfLeft) --Upper Full



end

return mod

tell application "System Events"
	tell process "SystemUIServer"
		click (menu bar item 1 of menu bar 1 whose description contains "Wi-Fi")
		click menu item "MuduchiTheru" of menu 1 of result
	end tell
end tell
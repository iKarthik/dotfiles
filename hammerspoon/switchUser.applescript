set thePassword to "" --Set to "" if you wish to specify the password manually each time
set theUser to "swa"
set theUser to do shell script "/usr/bin/id -u " & theUser
do shell script "/System/Library/CoreServices/Menu\\ Extras/User.menu/Contents/Resources/CGSession -switchToUserID " & theUser

	if thePassword is not "" then --Password has been specified
	repeat 2 times --Will only try twice before giving up
		try
			tell application "System Events"
			tell process "SecurityAgent" to set value of text field 1 of group 1 of window 1 to thePassword
			click button 2 of window 1 of application process "SecurityAgent"
			end tell
			display dialog "repeating"
			exit repeat
			on error
		end try
	end repeat
end if
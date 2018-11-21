tell application "Google Chrome"
    set win_List to every window
    set win_MatchList to {}
    set tab_MatchList to {}
    set tab_NameMatchList to {}
    repeat with win in win_List
        set tab_list to every tab of win
        repeat with t in tab_list
            if "Google" is in (title of t as string) then
                set end of win_MatchList to win
                set end of tab_MatchList to t
                set end of tab_NameMatchList to (id of win as string) & ".  " & (title of t as string)
            end if
        end repeat
    end repeat
    if (count of tab_MatchList) is equal to 1 then
        set w to item 1 of win_MatchList
        set index of w to 1
        my setActiveTabIndex(t, "Google")
    else if (count of tab_MatchList) is equal to 0 then
        display dialog "No match was found!" buttons {"OK"} default button 1
    else
        display dialog "multiple" buttons {"OK"} default button 1

    end if
end tell

on setActiveTabIndex(t, "Google")
    tell application "Google Chrome"
        set i to 0
        repeat with t in tabs of front window
            set i to i + 1
            if title of t contains "Google" then
                set active tab index of front window to i
                return
            end if
        end repeat
    end tell
end setActiveTabIndex
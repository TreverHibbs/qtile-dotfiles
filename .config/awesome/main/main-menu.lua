--[[
 ___      ___      __       __   _____  ___       ___      ___  _______ _____  ___  ____  ____  
|"  \    /"  |    /""\     |" \ (\"   \|"  \     |"  \    /"  |/"     "(\"   \|"  \("  _||_ " | 
 \   \  //   |   /    \    ||  ||.\\   \    |     \   \  //   (: ______).\\   \    |   (  ) : | 
 /\\  \/.    |  /' /\  \   |:  ||: \.   \\  |     /\\  \/.    |\/    | |: \.   \\  (:  |  | . ) 
|: \.        | //  __'  \  |.  ||.  \    \. |    |: \.        |// ___)_|.  \    \. |\\ \__/ //  
|.  \    /:  |/   /  \\  \ /\  |\    \    \ |    |.  \    /:  (:      "|    \    \ |/\\ __ //\  
|___|\__/|___(___/    \___|__\_|_)___|\____\)    |___|\__/|___|\_______)\___|\____\|__________) 

--]]
-- ============================================================================
local beautiful = require("beautiful")
local awful = require("awful")
local freedesktop = pcall(require, "freedesktop")
local debian = require("debian.menu")
local menubar = require("menubar")
-- ============================================================================
beautiful.awesome_icon = "/home/treverhibbs/.config/awesome/jiji.png"
-- ============================================================================
-- {{{ Menu
-- Create a launcher widget and a main menu
myawesomemenu = {
   { "hotkeys", function() hotkeys_popup.show_help(nil, awful.screen.focused()) end },
   { "manual", terminal .. " -e man awesome" },
   { "edit config", editor_cmd .. " " .. awesome.conffile },
   { "restart", awesome.restart },
   { "quit", function() awesome.quit() end },
}

local menu_awesome = { "awesome", myawesomemenu, beautiful.awesome_icon }
local menu_terminal = { "open terminal", terminal }

if has_fdo then
    mymainmenu = freedesktop.menu.build({
        before = { menu_awesome },
        after =  { menu_terminal }
    })
else
    mymainmenu = awful.menu({
        items = {
                  menu_awesome,
                  { "Debian", debian.menu.Debian_menu.Debian },
                  menu_terminal,
                }
    })
end
-- ============================================================================
mylauncher = awful.widget.launcher({ image = beautiful.awesome_icon,
                                     menu = mymainmenu })
-- ============================================================================
-- Menubar configuration
menubar.utils.terminal = terminal -- Set the terminal for applications that require it
-- ============================================================================


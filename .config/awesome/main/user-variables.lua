--[[
____  ____  ________ _______  _______       ___      ___ __       _______   
("  _||_ " |/"       )"     "|/"      \     |"  \    /"  /""\     /"      \  
|   (  ) : (:   \___(: ______):        |     \   \  //  /    \   |:        | 
(:  |  | . )\___  \  \/    | |_____/   )      \\  \/. ./' /\  \  |_____/   ) 
 \\ \__/ //  __/  \\ // ___)_ //      /        \.    ///  __'  \  //      /  
 /\\ __ //\ /" \   :|:      "|:  __   \         \\   /   /  \\  \|:  __   \  
(__________|_______/ \_______)__|  \___)         \__(___/    \___)__|  \___) 

-- >> The file that sets my user options
--]]
local beautiful = require("beautiful")
-- ===================================================================
dpi = beautiful.xresources.apply_dpi
-- ===================================================================
-- {{{ Variable definitions
-- This is used later as the default terminal and editor to run.
terminal = "urxvt"
editor = os.getenv("EDITOR") or "editor"
editor_cmd = terminal .. " -e " .. editor
-- ===================================================================
-- Default modkey.
-- Usually, Mod4 is the key with a logo between Control and Alt.
-- If you do not like this or do not have such a key,
-- I suggest you to remap Mod4 to another key using xmodmap or other tools.
-- However, you can use another modifier like Mod1, but it may interact with others.
modkey = "Mod4"
-- ===================================================================
-- available themes
local themes = {
    "mytheme",       -- 1
    "multicolor",    -- 2
}
-- ===================================================================
-- variable for choosing theme
chosen_theme = themes[1]
-- ===================================================================


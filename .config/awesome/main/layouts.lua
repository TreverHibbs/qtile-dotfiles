--[[
 ___           __      ___  ___ ______   ____  ____ ___________ ________  
|"  |         /""\    |"  \/"  /    " \ ("  _||_ " ("     _   ")"       ) 
||  |        /    \    \   \  // ____  \|   (  ) : |)__/  \\__(:   \___/  
|:  |       /' /\  \    \\  \/  /    ) :|:  |  | . )   \\_ /   \___  \    
 \  |___   //  __'  \   /   (: (____/ // \\ \__/ //    |.  |    __/  \\   
( \_|:  \ /   /  \\  \ /   / \        /  /\\ __ //\    \:  |   /" \   :)  
 \_______|___/    \___)___/   \"_____/  (__________)    \__|  (_______/   

-- ]]
                                                                          


-- ============================================================================
-- Standard awesome library
local awful = require("awful")
-- ============================================================================
local _M = {
-- ============================================================================
-- Table of layouts to cover with awful.layout.inc, order matters.
    layouts = {
        awful.layout.suit.floating,
        awful.layout.suit.tile,
        awful.layout.suit.tile.left,
        awful.layout.suit.tile.bottom,
        awful.layout.suit.tile.top,
        awful.layout.suit.fair,
        awful.layout.suit.fair.horizontal,
        awful.layout.suit.spiral,
        awful.layout.suit.spiral.dwindle,
        awful.layout.suit.max,
        awful.layout.suit.max.fullscreen,
        awful.layout.suit.magnifier,
        awful.layout.suit.corner.nw,
        -- awful.layout.suit.corner.ne,
        -- awful.layout.suit.corner.sw,
        -- awful.layout.suit.corner.se,
    },
-- ============================================================================
}

return _M


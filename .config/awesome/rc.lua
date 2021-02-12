--[[
  _______   ______         ___      ____  ____      __      
 /"      \ /" _  "\       |"  |    ("  _||_ " |    /""\     
|:        (: ( \___)      ||  |    |   (  ) : |   /    \    
|_____/   )\/ \           |:  |    (:  |  | . )  /' /\  \   
 //      / //  \ _   _____ \  |___  \\ \__/ //  //  __'  \  
|:  __   \(:   _) \ ))_  "| \_|:  \ /\\ __ //\ /   /  \\  \ 
|__|  \___)\_______|_____( \_______|__________|___/    \___)

--]]
-- If LuaRocks is installed, make sure that packages installed through it are
-- found (e.g. lgi). If LuaRocks is not installed, do nothing.
pcall(require, "luarocks.loader")
-- Standard awesome library
local gears = require("gears")
local awful = require("awful")
local rules = require("awful.rules")
require("awful.autofocus")
-- Widget and layout library
local wibox = require("wibox")
-- ===================================================================
-- Theme handling library
local beautiful = require("beautiful")
local xrdb = beautiful.xresources.get_current_theme()
-- Make dpi function global
dpi = beautiful.xresources.apply_dpi
-- Make xresources colors global
x = {
    --           xrdb variable
    background = xrdb.background,
    foreground = xrdb.foreground,
    color0     = xrdb.color0,
    color1     = xrdb.color1,
    color2     = xrdb.color2,
    color3     = xrdb.color3,
    color4     = xrdb.color4,
    color5     = xrdb.color5,
    color6     = xrdb.color6,
    color7     = xrdb.color7,
    color8     = xrdb.color8,
    color9     = xrdb.color9,
    color10    = xrdb.color10,
    color11    = xrdb.color11,
    color12    = xrdb.color12,
    color13    = xrdb.color13,
    color14    = xrdb.color14,
    color15    = xrdb.color15,
}
-- Notification library
local naughty = require("naughty")
local menubar = require("menubar")
local hotkeys_popup = require("awful.hotkeys_popup")
-- Enable hotkeys help widget for VIM and other apps
-- when client with a matching name is opened:
require("awful.hotkeys_popup.keys")
-- Load Debian menu entries
local debian = require("debian.menu")
local has_fdo, freedesktop = pcall(require, "freedesktop")
-- ===================================================================
client.connect_signal("manage", function (c)
  if c.class == nil then c.minimized = true
    c:connect_signal("property::class", function ()
      c.minimized = false
      awful.rules.apply(c)
    end)
  end
end)
-- ===================================================================
-- User variables and preferences
user = {
    -- >> Default applications <<
    -- Check apps.lua for more
    terminal = "urxvt",
    floating_terminal = "urxvt",
    browser = "firefox",
    file_manager = "kitty -1 --class files -e Thunar",
    editor = "kitty -1 --class editor -e vim",
    email_client = "thunderbird",
    music_client = "spotify",

    -- >> Web Search <<
    web_search_cmd = "xdg-open https://duckduckgo.com/?q=",
    -- web_search_cmd = "xdg-open https://www.google.com/search?q=",

    -- >> User profile <<
    profile_picture = os.getenv("HOME").."/.config/awesome/profile.png",

    -- Directories with fallback values
    dirs = {
        downloads = os.getenv("XDG_DOWNLOAD_DIR") or "~/Downloads",
        documents = os.getenv("XDG_DOCUMENTS_DIR") or "~/Documents",
        music = os.getenv("XDG_MUSIC_DIR") or "~/Music",
        pictures = os.getenv("XDG_PICTURES_DIR") or "~/Pictures",
        videos = os.getenv("XDG_VIDEOS_DIR") or "~/Videos",
        -- Make sure the directory exists so that your screenshots
        -- are not lost
        screenshots = "~/Pictures/Screenshots",
    },

    -- >> Sidebar <<
    sidebar = {
        hide_on_mouse_leave = true,
        show_on_mouse_screen_edge = true,
    },

    -- >> Lock screen <<
    -- This password will ONLY be used if you have not installed
    -- https://github.com/RMTT/lua-pam
    -- as described in the README instructions
    -- Leave it empty in order to unlock with just the Enter key.
    -- lock_screen_custom_password = "",
    lock_screen_custom_password = "awesome",

    -- >> Battery <<
    -- You will receive notifications when your battery reaches these
    -- levels.
    battery_threshold_low = 20,
    battery_threshold_critical = 5,

    -- >> Weather <<
    -- Get your key and find your city id at
    -- https://openweathermap.org/
    -- (You will need to make an account!)
    openweathermap_key = "xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx",
    openweathermap_city_id = "yyyyyy",
    -- > Use "metric" for Celcius, "imperial" for Fahrenheit
    weather_units = "metric",

    -- >> Coronavirus <<
    -- Country to check for corona statistics
    -- Uses the https://corona-stats.online API
    coronavirus_country = "usa",
}
-- >> Daemons
-- Most widgets that display system/external info depend on evil.
-- Make sure to initialize it last in order to allow all widgets to connect to
-- their needed evil signals.
require("evil")
-- ===================================================================
-- global declaration for helper functions
helpers = require("helpers")
-- ===================================================================
---[[ Error handling
require("main.error-handling")
--]]
-- ===================================================================
-- set pretty things
---[[
colors = beautiful.xresources.get_current_theme()
--]]
-- ===================================================================
-- Custom Local Library
local main = {
  layouts = require("main.layouts"),
}
-- ============================================================================
require("main.user-variables")
-- ============================================================================
-- Themes define colours, icons, font and wallpapers.
beautiful.init(string.format("%s/.config/awesome/themes/%s/theme.lua", os.getenv("HOME"), chosen_theme))
-- ============================================================================
awful.layout.layouts = main.layouts
-- ============================================================================
require("main.main-menu")
-- ============================================================================
-- Keyboard map indicator and switcher
mykeyboardlayout = awful.widget.keyboardlayout()
-- ============================================================================
--[[
 __   __  ___  __    _______      __       _______   
|"  |/  \|  "||" \  |   _  "\    /""\     /"      \  
|'  /    \:  |||  | (. |_)  :)  /    \   |:        | 
|: /'        ||:  | |:     \/  /' /\  \  |_____/   ) 
 \//  /\'    ||.  | (|  _  \\ //  __'  \  //      /  
 /   /  \\   |/\  |\|: |_)  :)   /  \\  \|:  __   \  
|___/    \___(__\_|_|_______(___/    \___)__|  \___) 
--]]
-- set possition of monitors
-- ============================================================================
awful.spawn("xrandr --output DP-1 --auto --right-of HDMI-1")
require("deco.statusbar")
-- ============================================================================
require("main.startup")
-- ============================================================================
require("bindings.mouse")
require("bindings.global")
require("bindings.client-keys")
-- ============================================================================
require("main.client")
-- ============================================================================
--[[
  _______ _____  ___  ________   
 /"     "(\"   \|"  \|"      "\  
(: ______).\\   \    (.  ___  :) 
 \/    | |: \.   \\  |: \   ) || 
 // ___)_|.  \    \. (| (___\ || 
(:      "|    \    \ |:       :) 
 \_______)\___|\____\|________/  
                                 
--]]

--[[
 ___________ __    __   _______ ___      ___  _______  
("     _   ")" |  | "\ /"     "|"  \    /"  |/"     "| 
 )__/  \\__(:  (__)  :|: ______)\   \  //   (: ______) 
    \\_ /   \/      \/ \/    |  /\\  \/.    |\/    |   
    |.  |   //  __  \\ // ___)_|: \.        |// ___)_  
    \:  |  (:  (  )  :|:      "|.  \    /:  (:      "| 
     \__|   \__|  |__/ \_______)___|\__/|___|\_______) 
                                                       
--]]
-- ============================================================================
local theme_assets = require("beautiful.theme_assets")
local xresources = require("beautiful.xresources")
local dpi = xresources.apply_dpi
local gears = require("gears")
local awful = require("awful")
-- ============================================================================
local gfs = require("gears.filesystem")
local themes_path = gfs.get_themes_dir()
-- ============================================================================
local theme = {}
local colors = xresources.get_current_theme();
-- ============================================================================
theme.font          = "Hack 12"

theme.bg_normal     = colors["background"]
theme.bg_focus      = colors["background"]
theme.bg_urgent     = colors["background"]
theme.bg_minimize   = "#0a1313"

theme.fg_normal     = colors["foreground"]
theme.fg_focus      = colors["color6"]
theme.fg_urgent     = colors["color4"]
theme.fg_minimize   = colors["color11"]

theme.useless_gap   = dpi(15)
theme.border_width  = dpi(1)
theme.border_normal = theme.bg_normal
theme.border_focus  = colors["color4"]
theme.border_marked = colors["color6"]
-- ============================================================================
-- tasklist theme
theme.tasklist_bg_normal = colors["background"] 

theme.tasklist_fg_normal = colors["foreground"] 
theme.tasklist_fg_focus = colors["color0"] 

theme.tasklist_border_color = colors["color0"]
theme.tasklist_border_color_focus = colors["color0"]

theme.tasklist_align = "center"
theme.tasklist_shape = gears.shape.rounded_bar
-- ============================================================================
-- Minimal Tasklist theme
theme.minimal_tasklist_visible_clients_color = colors["color4"]
theme.minimal_tasklist_hidden_clients_color = colors["color6"]
-- ============================================================================
-- systray theme
theme.bg_systray    = theme.bg_normal
theme.systray_icon_spacing = dpi(10)
-- ============================================================================
-- if(awful.tag.master_width_factor and theme.useless_gap) then
--     theme.wibar_width = awful.tag.master_width_factor - theme.useless_gap
-- else
--     theme.wibar_width = dpi(1847)
-- end
-- ============================================================================
-- wibar theme
theme.wibar_width = dpi(1859)
-- theme.wibar_width = awful.tag.master_width_factor - theme.useless_gap
theme.wibar_bg = colors["background"]
theme.wibar_fg = colors["foreground"]
theme.wibar_border_color = colors["background"]
theme.wibar_border_width = dpi(5)
theme.wibar_shape = gears.shape.rounded_rect
theme.wibar_position = "top"
theme.wibar_max_name_len = 30
-- ============================================================================
-- taglist theme
theme.taglist_fg_focus  = colors["color4"]
theme.taglist_fg_empty = "#44744f"
theme.taglist_fg_occupied = "#44744f"
theme.taglist_fg_urgent = colors["color6"]
-- ============================================================================
-- keybind theme
theme.hotkeys_modifiers_fg = colors["color6"]
theme.hotkeys_border_color = colors["color4"]
theme.hotkeys_shape = gears.shape.rounded_rect
-- ============================================================================
-- prompt theme
theme.prompt_bg = colors["background"]
theme.prompt_bg_cursor = colors["foreground"]
theme.prompt_fg = colors["foreground"]
theme.prompt_fg_cursor = colors["foreground"]
-- ============================================================================
-- There are other variable sets
-- overriding the default one when
-- defined, the sets are:
-- taglist_[bg|fg]_[focus|urgent|occupied|empty|volatile]
-- tasklist_[bg|fg]_[focus|urgent]
-- titlebar_[bg|fg]_[normal|focus]
-- tooltip_[font|opacity|fg_color|bg_color|border_width|border_color]
-- mouse_finder_[color|timeout|animate_timeout|radius|factor]
-- prompt_[fg|bg|fg_cursor|bg_cursor|font]
-- hotkeys_[bg|fg|border_width|border_color|shape|opacity|modifiers_fg|label_bg|label_fg|group_margin|font|description_font]
-- Example:
-- theme.taglist_bg_focus = "#ff0000"

-- Generate taglist squares:
local taglist_square_size = dpi(4)
theme.taglist_squares_sel = theme_assets.taglist_squares_sel(
    taglist_square_size, theme.fg_normal
)
theme.taglist_squares_unsel = theme_assets.taglist_squares_unsel(
    taglist_square_size, theme.fg_normal
)

-- Variables set for theming notifications:
-- notification_font
-- notification_[bg|fg]
-- notification_[width|height|margin]
-- notification_[border_color|border_width|shape|opacity]

-- Variables set for theming the menu:
-- menu_[bg|fg]_[normal|focus]
-- menu_[border_color|border_width]
theme.menu_submenu_icon = themes_path.."default/submenu.png"
theme.menu_height = dpi(15)
theme.menu_width  = dpi(100)

-- You can add as many variables as
-- you wish and access them by using
-- beautiful.variable in your rc.lua
--theme.bg_widget = "#cc0000"

-- Define the image to load
theme.titlebar_close_button_normal = themes_path.."default/titlebar/close_normal.png"
theme.titlebar_close_button_focus  = themes_path.."default/titlebar/close_focus.png"

theme.titlebar_minimize_button_normal = themes_path.."default/titlebar/minimize_normal.png"
theme.titlebar_minimize_button_focus  = themes_path.."default/titlebar/minimize_focus.png"

theme.titlebar_ontop_button_normal_inactive = themes_path.."default/titlebar/ontop_normal_inactive.png"
theme.titlebar_ontop_button_focus_inactive  = themes_path.."default/titlebar/ontop_focus_inactive.png"
theme.titlebar_ontop_button_normal_active = themes_path.."default/titlebar/ontop_normal_active.png"
theme.titlebar_ontop_button_focus_active  = themes_path.."default/titlebar/ontop_focus_active.png"

theme.titlebar_sticky_button_normal_inactive = themes_path.."default/titlebar/sticky_normal_inactive.png"
theme.titlebar_sticky_button_focus_inactive  = themes_path.."default/titlebar/sticky_focus_inactive.png"
theme.titlebar_sticky_button_normal_active = themes_path.."default/titlebar/sticky_normal_active.png"
theme.titlebar_sticky_button_focus_active  = themes_path.."default/titlebar/sticky_focus_active.png"

theme.titlebar_floating_button_normal_inactive = themes_path.."default/titlebar/floating_normal_inactive.png"
theme.titlebar_floating_button_focus_inactive  = themes_path.."default/titlebar/floating_focus_inactive.png"
theme.titlebar_floating_button_normal_active = themes_path.."default/titlebar/floating_normal_active.png"
theme.titlebar_floating_button_focus_active  = themes_path.."default/titlebar/floating_focus_active.png"

theme.titlebar_maximized_button_normal_inactive = themes_path.."default/titlebar/maximized_normal_inactive.png"
theme.titlebar_maximized_button_focus_inactive  = themes_path.."default/titlebar/maximized_focus_inactive.png"
theme.titlebar_maximized_button_normal_active = themes_path.."default/titlebar/maximized_normal_active.png"
theme.titlebar_maximized_button_focus_active  = themes_path.."default/titlebar/maximized_focus_active.png"

theme.wallpaper = "/home/treverhibbs/Pictures/Wallpapers/wal/kikis_house_crop.png"

-- You can use your own layout icons like this:
theme.layout_fairh = themes_path.."default/layouts/fairhw.png"
theme.layout_fairv = themes_path.."default/layouts/fairvw.png"
theme.layout_floating  = themes_path.."default/layouts/floatingw.png"
theme.layout_magnifier = themes_path.."default/layouts/magnifierw.png"
theme.layout_max = themes_path.."default/layouts/maxw.png"
theme.layout_fullscreen = themes_path.."default/layouts/fullscreenw.png"
theme.layout_tilebottom = themes_path.."default/layouts/tilebottomw.png"
theme.layout_tileleft   = themes_path.."default/layouts/tileleftw.png"
theme.layout_tile = themes_path.."default/layouts/tilew.png"
theme.layout_tiletop = themes_path.."default/layouts/tiletopw.png"
theme.layout_spiral  = themes_path.."default/layouts/spiralw.png"
theme.layout_dwindle = themes_path.."default/layouts/dwindlew.png"
theme.layout_cornernw = themes_path.."default/layouts/cornernww.png"
theme.layout_cornerne = themes_path.."default/layouts/cornernew.png"
theme.layout_cornersw = themes_path.."default/layouts/cornersww.png"
theme.layout_cornerse = themes_path.."default/layouts/cornersew.png"

-- ============================================================================
-- Rounded corners
theme.border_radius = dpi(5)
-- enable rounded borders
-- client.connect_signal("manage", function (c)
--     c.shape = gears.shape.rounded_rect
-- end)
-- ============================================================================

-- Generate Awesome icon:
theme.awesome_icon = theme_assets.awesome_icon(
    theme.menu_height, theme.bg_focus, theme.fg_focus
)

-- Define the icon theme for application icons. If not set then the icons
-- from /usr/share/icons and /usr/share/icons/hicolor will be used.
chosen_icon_theme = "Reversal-green-dark"
theme.icon_theme = string.format("%s/.local/share/icons/%s", os.getenv("HOME"), chosen_icon_theme)
-- gears.debug.dump(theme.icon_theme)

return theme

-- vim: filetype=lua:expandtab:shiftwidth=4:tabstop=8:softtabstop=4:textwidth=80

--[[
 __   __  ___  __    _______      __       _______   
|"  |/  \|  "||" \  |   _  "\    /""\     /"      \  
|'  /    \:  |||  | (. |_)  :)  /    \   |:        | 
|: /'        ||:  | |:     \/  /' /\  \  |_____/   ) 
 \//  /\'    ||.  | (|  _  \\ //  __'  \  //      /  
 /   /  \\   |/\  |\|: |_)  :)   /  \\  \|:  __   \  
|___/    \___(__\_|_|_______(___/    \___)__|  \___) 

--]]

local beautiful = require("beautiful")
local awful = require("awful")
local gears = require("gears")
local wibox = require("wibox")
local minimal_tasklist = require("deco.minimal-tasklist")
local current_client = require("deco.current-client")
local volume_bar = require("deco.volume_bar")
-- ============================================================================
-- Create padding
pad = wibox.widget.textbox(" ")
-- ============================================================================
-- Create a textclock widget
mytextclock = wibox.widget.textclock()
mytextclock.format = "%_I:%M%P"
-- ============================================================================
-- Create a wibox for each screen and add it
local taglist_buttons = gears.table.join(
                    awful.button({ }, 1, function(t) t:view_only() end),
                    awful.button({ modkey }, 1, function(t)
                                              if client.focus then
                                                  client.focus:move_to_tag(t)
                                              end
                                          end),
                    awful.button({ }, 3, awful.tag.viewtoggle),
                    awful.button({ modkey }, 3, function(t)
                                              if client.focus then
                                                  client.focus:toggle_tag(t)
                                              end
                                          end),
                    awful.button({ }, 4, function(t) awful.tag.viewnext(t.screen) end),
                    awful.button({ }, 5, function(t) awful.tag.viewprev(t.screen) end)
                )
-- ============================================================================
local tasklist_buttons = gears.table.join(
                     awful.button({ }, 1, function (c)
                                              if c == client.focus then
                                                  c.minimized = true
                                              else
                                                  c:emit_signal(
                                                      "request::activate",
                                                      "tasklist",
                                                      {raise = true}
                                                  )
                                              end
                                          end),
                     awful.button({ }, 3, function()
                                              awful.menu.client_list({ theme = { width = 250 } })
                                          end),
                     awful.button({ }, 4, function ()
                                              awful.client.focus.byidx(1)
                                          end),
                     awful.button({ }, 5, function ()
                                              awful.client.focus.byidx(-1)
                                          end))

-- ============================================================================
local function set_wallpaper(s)
    -- Wallpaper
    if beautiful.wallpaper then
        local wallpaper = beautiful.wallpaper
        -- If wallpaper is a function, call it with the screen
        if type(wallpaper) == "function" then
            wallpaper = wallpaper(s)
        end
        gears.wallpaper.maximized(wallpaper, s, true)
    end
end
-- ============================================================================
-- Re-set wallpaper when a screen's geometry changes (e.g. different resolution)
screen.connect_signal("property::geometry", set_wallpaper)
-- ============================================================================
---[[
awful.screen.connect_for_each_screen(function(s)
    -- Wallpaper
    set_wallpaper(s)

    -- Each screen has its own tag table.
    -- screen index 1 is main monitor
    --local l = awful.layout.suit  -- Just to save some typing: use an alias.
    --local layouts = { l.tile, l.tile, l.max, l.max, l.tile,
    --                  l.tile, l.tile, l.tile, l.tile }
    --layouts[1] = l.tile
    --layouts[2] = l.tile
    --layouts[3] = l.max
    --layouts[4] = l.tile
    --layouts[5] = l.tile
    --layouts[6] = l.max
    --local names = { "1", "2", "3", "4", "5", "6" }

    --if s.index ~= 1 then
    --    layouts = { l.tile.left, l.tile.left, l.tile.left, l.tile.left, l.tile.left,
    --                l.tile.left, l.tile.left, l.tile.left, l.tile.left }
    --    layouts[1] = l.tile
    --    layouts[2] = l.tile
    --    layouts[3] = l.max
    --    layouts[4] = l.tile
    --    layouts[5] = l.tile
    --    layouts[6] = l.max
    --end
    --awful.tag(names, s, layouts)
-- ============================================================================
    -- Create a promptbox for each screen
    s.mypromptbox = awful.widget.prompt()
    -- Create an imagebox widget which will contain an icon indicating which layout we're using.
    -- We need one layoutbox per screen.
    s.mylayoutbox = awful.widget.layoutbox(s)
    s.mylayoutbox.margins = {
        top = dpi(10),
        bottom = dpi(10),
    }
    s.mylayoutbox:buttons(gears.table.join(
                           awful.button({ }, 1, function () awful.layout.inc( 1) end),
                           awful.button({ }, 3, function () awful.layout.inc(-1) end),
                           awful.button({ }, 4, function () awful.layout.inc( 1) end),
                           awful.button({ }, 5, function () awful.layout.inc(-1) end)))
-- ============================================================================
    -- Create a taglist widget
    s.mytaglist = awful.widget.taglist {
        screen  = s,
        filter  = awful.widget.taglist.filter.all,
        buttons = taglist_buttons,
        style   = {
            shape  = gears.shape.rounded_bar,
            align  = "center",
        }
    }
-- ============================================================================
    -- Create a tasklist widget
    s.mytasklist = awful.widget.tasklist {
        screen  = s,
        filter  = awful.widget.tasklist.filter.currenttags,
        buttons = tasklist_buttons,
    }
-- ============================================================================
    -- Create the wibox
    s.mywibox = awful.wibar({ 
                       visible = true,
                       type = "dock",
                       position = "top",
                       height = 35,
                       width = beautiful.wibar_width,
                       screen = s,
                       border_color = "#00000000",
                       border_width = 0,
                      })

    s.mywibox.bg = "#00000000"
-- ============================================================================
    s.mywibox:setup {
        -- Container
        {
            {
                { -- Some padding
                    layout = wibox.layout.fixed.horizontal
                },
                mylauncher,
                s.mytaglist,
                spacing = dpi(12),
                layout = wibox.layout.fixed.horizontal
            },
            current_client,
            {
                minimal_tasklist,
                -- wibox.widget.systray(),
                volume_bar,
                mytextclock,
                s.mylayoutbox,
                pad,
                spacing = dpi(12),
                layout = wibox.layout.fixed.horizontal
            },
            expand = "none",
            layout = wibox.layout.align.horizontal
        },
        bg = beautiful.wibar_bg,
        shape = gears.shape.rounded_rect,
        widget = wibox.container.background()
    }
    
    awful.placement.top(s.mywibox, { margins = beautiful.useless_gap*2 })
    s.padding = { top = s.padding.top + beautiful.useless_gap*2}
end)
--]]
-- ============================================================================


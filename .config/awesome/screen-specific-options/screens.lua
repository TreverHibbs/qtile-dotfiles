local configPath = awful.util.getdir("config") .. "/"

dofile configPath .. "screen-specific-options/wallpaper.lua"



function screensInit ()
    awful.screen.connect_for_each_screen(function(s)
        -- Wallpaper
        set_wallpaper(s)
    
        -- Each screen has its own tag table.
        -- screen index 1 is main monitor
        local l = awful.layout.suit  -- Just to save some typing: use an alias.
        local layouts = { l.tile, l.tile, l.tile, l.tile, l.tile,
                          l.tile, l.tile, l.tile, l.tile }
        local names = { "1", "2", "3", "4", "5", "6", "7", "8", "9" }
    
        if s.index ~= 1 then
            layouts = { l.tile.left, l.tile.left, l.tile.left, l.tile.left, l.tile.left,
                        l.tile.left, l.tile.left, l.tile.left, l.tile.left }
        end
    
        awful.tag(names, s, layouts)
    
        -- Create a promptbox for each screen
        s.mypromptbox = awful.widget.prompt()
        -- Create an imagebox widget which will contain an icon indicating which layout we're using.
        -- We need one layoutbox per screen.
        s.mylayoutbox = awful.widget.layoutbox(s)
        s.mylayoutbox:buttons(gears.table.join(
                               awful.button({ }, 1, function () awful.layout.inc( 1) end),
                               awful.button({ }, 3, function () awful.layout.inc(-1) end),
                               awful.button({ }, 4, function () awful.layout.inc( 1) end),
                               awful.button({ }, 5, function () awful.layout.inc(-1) end)))
        -- Create a taglist widget
        s.mytaglist = awful.widget.taglist {
            screen  = s,
            filter  = awful.widget.taglist.filter.all,
            buttons = taglist_buttons
        }
    
        -- Create a tasklist widget
        s.mytasklist = awful.widget.tasklist {
            screen  = s,
            filter  = awful.widget.tasklist.filter.currenttags,
            buttons = tasklist_buttons
        }
    
        -- Create the wibox
        s.mywibox = awful.wibar({ position = "top", screen = s })
    
        -- Add widgets to the wibox
        s.mywibox:setup {
            layout = wibox.layout.align.horizontal,
            { -- Left widgets
                layout = wibox.layout.fixed.horizontal,
                mylauncher,
                s.mytaglist,
                s.mypromptbox,
            },
            s.mytasklist, -- Middle widget
            { -- Right widgets
                layout = wibox.layout.fixed.horizontal,
                mykeyboardlayout,
                wibox.widget.systray(),
                mytextclock,
                s.mylayoutbox,
            },
        }
    end)
end

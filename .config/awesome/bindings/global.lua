--[[
  _______  ___       ______   _______      __     ___       
 /" _   "||"  |     /    " \ |   _  "\    /""\   |"  |      
(: ( \___)||  |    // ____  \(. |_)  :)  /    \  ||  |      
 \/ \     |:  |   /  /    ) :):     \/  /' /\  \ |:  |      
 //  \ ___ \  |__(: (____/ //(|  _  \\ //  __'  \ \  |___   
(:   _(  _( \_|:  \        / |: |_)  :)   /  \\  ( \_|:  \  
 \_______) \_______)"_____/  (_______(___/    \___)_______) 
  __   ___ _______ ___  ___ ________  
|/"| /  ")"     "|"  \/"  /"       ) 
(: |/   (: ______)\   \  (:   \___/  
|    __/ \/    |   \\  \/ \___  \    
(// _  \ // ___)_  /   /   __/  \\   
|: | \  (:      "|/   /   /" \   :)  
(__|  \__)_______)___/   (_______/   

--]]

local gears = require("gears")                                                                                                         
local awful = require("awful")
local hotkeys_popup = require("awful.hotkeys_popup")
local run_shell = require("awesome-wm-widgets.run-shell.run-shell")
local logout = require("awesome-wm-widgets.logout-popup-widget.logout-popup")
local tyrannical = require("tyrannical")
local apps = require("apps")


-- ============================================================================
-- {{{ Key bindings
-- Table of layouts to cover with awful.layout.inc, order matters.
awful.layout.layouts = {
  awful.layout.suit.floating,
  awful.layout.suit.tile,
  awful.layout.suit.tile.left,
  -- awful.layout.suit.tile.bottom,
  -- awful.layout.suit.tile.top,
  -- awful.layout.suit.fair,
  -- awful.layout.suit.fair.horizontal,
  -- awful.layout.suit.spiral,
  -- awful.layout.suit.spiral.dwindle,
  awful.layout.suit.max,
  -- awful.layout.suit.max.fullscreen,
  -- awful.layout.suit.magnifier,
  -- awful.layout.suit.corner.nw,
  -- awful.layout.suit.corner.ne,
  -- awful.layout.suit.corner.sw,
  -- awful.layout.suit.corner.se,
}
-- ============================================================================
-- {{{ Key bindings
globalkeys = gears.table.join(
    awful.key({ modkey,           }, "s",      hotkeys_popup.show_help,
              {description="show help", group="awesome"}),
    awful.key({ modkey,           }, "[",   awful.tag.viewprev,
              {description = "view previous", group = "tag"}),
    awful.key({ modkey,           }, "]",  awful.tag.viewnext,
              {description = "view next", group = "tag"}),
    awful.key({ modkey,           }, "Escape", awful.tag.history.restore,
              {description = "go back", group = "tag"}),

    awful.key({ modkey,           }, "j",
        function ()
            awful.client.focus.byidx( 1)
        end,
        {description = "focus next by index", group = "client"}
    ),
    awful.key({ modkey,           }, "k",
        function ()
            awful.client.focus.byidx(-1)
        end,
        {description = "focus previous by index", group = "client"}
    ),
    awful.key({ modkey,           }, "w", function () mymainmenu:show() end,
              {description = "show main menu", group = "awesome"}),
-- ============================================================================
    -- Layout manipulation
    awful.key({ modkey, "Shift"   }, "j", function () awful.client.swap.byidx(  1)    end,
              {description = "swap with next client by index", group = "client"}),
    awful.key({ modkey, "Shift"   }, "k", function () awful.client.swap.byidx( -1)    end,
              {description = "swap with previous client by index", group = "client"}),
    awful.key({ modkey, "Control" }, "j", function () awful.screen.focus_relative( 1) end,
              {description = "focus the next screen", group = "screen"}),
    awful.key({ modkey, "Control" }, "k", function () awful.screen.focus_relative(-1) end,
              {description = "focus the previous screen", group = "screen"}),
    awful.key({ modkey,           }, "u", awful.client.urgent.jumpto,
              {description = "jump to urgent client", group = "client"}),
    awful.key({ modkey,           }, "Tab",
        function ()
            awful.client.focus.history.previous()
            if client.focus then
                client.focus:raise()
            end
        end,
        {description = "go back", group = "client"}),
-- ============================================================================
    -- Multimedia keys
    awful.key({}, "XF86AudioRaiseVolume", function () helpers.volume_control(5) end),
    awful.key({}, "XF86AudioLowerVolume", function () helpers.volume_control(-5) end),
    awful.key({}, "XF86AudioMute", function () awful.util.spawn("amixer -D pulse sset Master toggle") end),
    awful.key({}, "XF86AudioPlay", function () awful.util.spawn("playerctl play-pause") end),
    awful.key({}, "XF86AudioNext", function () awful.util.spawn("playerctl next") end),
    awful.key({}, "XF86AudioPrev", function () awful.util.spawn("playerctl previous") end),
-- ============================================================================
    -- Standard program
    awful.key({ modkey,           }, "Return", function () awful.spawn(terminal) end,
              {description = "open a terminal", group = "launcher"}),
    awful.key({ modkey, "Control" }, "r", awesome.restart,
              {description = "reload awesome", group = "awesome"}),
    awful.key({ modkey, "Shift"   }, "q", awesome.quit,
              {description = "quit awesome", group = "awesome"}),
    awful.key({ modkey,  }, "b", function () awful.spawn("firefox") end,
              {description="start firefox", group="launcher"}),

    awful.key({ modkey,           }, "l",     function () awful.tag.incmwfact( 0.05)          end,
              {description = "increase master width factor", group = "layout"}),
    awful.key({ modkey,           }, "h",     function () awful.tag.incmwfact(-0.05)          end,
              {description = "decrease master width factor", group = "layout"}),
    awful.key({ modkey, "Shift"   }, "h",     function () awful.tag.incnmaster( 1, nil, true) end,
              {description = "increase the number of master clients", group = "layout"}),
    awful.key({ modkey, "Shift"   }, "l",     function () awful.tag.incnmaster(-1, nil, true) end,
              {description = "decrease the number of master clients", group = "layout"}),
    awful.key({ modkey, "Control" }, "h",     function () awful.tag.incncol( 1, nil, true)    end,
              {description = "increase the number of columns", group = "layout"}),
    awful.key({ modkey, "Control" }, "l",     function () awful.tag.incncol(-1, nil, true)    end,
              {description = "decrease the number of columns", group = "layout"}),
    awful.key({ modkey,           }, "space", function () awful.layout.inc( 1)                end,
              {description = "select next", group = "layout"}),
    awful.key({ modkey, "Shift"   }, "space", function () awful.layout.inc(-1)                end,
              {description = "select previous", group = "layout"}),

    awful.key({ modkey, "Control" }, "n",
              function ()
                  local c = awful.client.restore()
                  -- Focus restored client
                  if c then
                    c:emit_signal(
                        "request::activate", "key.unminimize", {raise = true}
                    )
                  end
              end,
              {description = "restore minimized", group = "client"}),
-- ============================================================================
    -- custom run shell
    awful.key({modkey}, "d", function () run_shell.launch() end,{description = "launch run shell", group = "awesome"}),
        
-- ============================================================================
    -- custom logout menu
    awful.key({ modkey }, "p", function() logout.launch() end, {description = "Show logout screen", group = "awesome"}),
-- ============================================================================
    -- Screenshots
    awful.key( { }, "Print", function() apps.screenshot("full") end,
        {description = "take full screenshot", group = "screenshots"}),
    awful.key( { modkey, "Shift" }, "c", function() apps.screenshot("selection") end,
        {description = "select area to capture", group = "screenshots"}),
    awful.key( { modkey, "Ctrl" }, "c", function() apps.screenshot("clipboard") end,
        {description = "select area to copy to clipboard", group = "screenshots"}),
    awful.key( { modkey }, "Print", function() apps.screenshot("browse") end,
        {description = "browse screenshots", group = "screenshots"}),
    awful.key( { modkey, "Shift" }, "Print", function() apps.screenshot("gimp") end,
        {description = "edit most recent screenshot with gimp", group = "screenshots"})
-- ============================================================================
    -- Tyrannical Prompt
--    awful.key({ modkey }, "d",
--        function ()
--            awful.prompt.run({ prompt = "Run: ", hooks = {
--                {{         },"Return",function(command)
--                    local result = awful.spawn(command)
--                    mypromptbox[mouse.screen].widget:set_text(type(result) == "string" and result or "")
--                    return true
--                end},
--                {{"Mod1"   },"Return",function(command)
--                    local result = awful.spawn(command,{intrusive=true})
--                    mypromptbox[mouse.screen].widget:set_text(type(result) == "string" and result or "")
--                    return true
--                end},
--                {{"Shift"  },"Return",function(command)
--                    local result = awful.spawn(command,{intrusive=true,ontop=true,floating=true})
--                    mypromptbox[mouse.screen].widget:set_text(type(result) == "string" and result or "")
--                    return true
--                end}
--            }},
--            mypromptbox[mouse.screen].widget,nil,
--            awful.completion.shell,
--            awful.util.getdir("cache") .. "/history")
--        end)
-- ============================================================================
    -- Prompt
--    awful.key({ modkey },            "d",     function () 
--    awful.util.spawn("rofi -show run") end,
--                    {description = "run the dmenu prompt", group = "awesome"}),
--
--    awful.key({ modkey }, "x",
--              function ()
--                  awful.prompt.run {
--                    prompt       = "Run Lua code: ",
--                    textbox      = awful.screen.focused().mypromptbox.widget,
--                    exe_callback = awful.util.eval,
--                    history_path = awful.util.get_cache_dir() .. "/history_eval"
--                  }
--              end,
--              {description = "lua execute prompt", group = "awesome"}),
-- ============================================================================
    -- Menubar
--    awful.key({ modkey }, "p", function() menubar.show() end,
--              {description = "show the menubar", group = "launcher"})
-- ============================================================================
) -- end global keys
-- ============================================================================
-- Bind all key numbers to tags.
-- Be careful: we use keycodes to make it work on any keyboard layout.
-- This should map on the top row of your keyboard, usually 1 to 9.
for i = 1, 9 do
    globalkeys = gears.table.join(globalkeys,
        -- View tag only.
        awful.key({ modkey }, "#" .. i + 9,
                  function ()
                        local screen = awful.screen.focused()
                        local tag = screen.tags[i]
                        if tag then
                           tag:view_only()
                        else -- create new tag on currently focused screen if it does not extst
                            local focused_screen = awful.screen.focused()
                            local screen_specific_layout
                            -- print("screen index" .. focused_screen.index)
                            if (focused_screen.index == 1) then
                                screen_specific_layout = awful.layout.suit.tile  
                            else
                                screen_specific_layout = awful.layout.suit.tile.left  
                            end
                            awful.tag.add(i .. "", {
                                screen = focused_screen,
                                layout = screen_specific_layout }
                            ):view_only()
                        end
                  end,
                  {description = "view tag #"..i, group = "tag"}),
        -- Toggle tag display.
        awful.key({ modkey, "Control" }, "#" .. i + 9,
                  function ()
                      local screen = awful.screen.focused()
                      local tag = screen.tags[i]
                      if tag then
                         awful.tag.viewtoggle(tag)
                      end
                  end,
                  {description = "toggle tag #" .. i, group = "tag"}),
        -- Move client to tag.
        awful.key({ modkey, "Shift" }, "#" .. i + 9,
                  function ()
                      if client.focus then
                          local tag = client.focus.screen.tags[i]
                          if tag then
                              client.focus:move_to_tag(tag)
                          end
                     end
                  end,
                  {description = "move focused client to tag #"..i, group = "tag"}),
        -- Toggle tag on focused client.
        awful.key({ modkey, "Control", "Shift" }, "#" .. i + 9,
                  function ()
                      if client.focus then
                          local tag = client.focus.screen.tags[i]
                          if tag then
                              client.focus:toggle_tag(tag)
                          end
                      end
                  end,
                  {description = "toggle focused client on tag #" .. i, group = "tag"})
    )
end
-- ============================================================================
clientbuttons = gears.table.join(
    awful.button({ }, 1, function (c)
        c:emit_signal("request::activate", "mouse_click", {raise = true})
    end),
    awful.button({ modkey }, 1, function (c)
        c:emit_signal("request::activate", "mouse_click", {raise = true})
        awful.mouse.client.move(c)
    end),
    awful.button({ modkey }, 3, function (c)
        c:emit_signal("request::activate", "mouse_click", {raise = true})
        awful.mouse.client.resize(c)
    end)
)
-- ============================================================================
-- Set keys
root.keys(globalkeys)
-- }}}


local ruled = require("ruled")
local awful = require("awful")
local tyrannical = require("tyrannical")





---[[ Startup daemons
awful.spawn.with_shell("sh -c 'pgrep picom > /dev/null && echo || picom --experimental-backends --config ~/.config/picom/picom.conf &'")
---]]

---[[ Increment functions
function increment (id)
    id = id + 1
    return id
end
---]]

---[[ tyrannical tags
tyrannical.tags = {
    {
        --home
        name        = "1",
        init        = true, 
        exclusive   = false,
        screen      = {1},
        selected    = true,
        layout      = awful.layout.suit.tile,
    } ,
    {
        --home left screen
        name        = "1",
        init        = true, 
        exclusive   = false,
        screen      = {2},
        selected    = true,
        layout      = awful.layout.suit.tile.left,
    } ,
    {
        --terminal
        name        = "2",                 -- Call the tag "Term"
        init        = true,                   -- Load the tag on startup
        exclusive   = false,                   -- Refuse any other type of clients (by classes)
        screen      = 1,                  
        layout      = awful.layout.suit.tile, -- Use the tile layout
        instance    = {"dev", "ops"},         -- Accept the following instances. This takes precedence over 'class'
        exec_once   = {"urxvt"}, --When the tag is accessed for the first time, execute this command
    } ,
    {
        --internet
        name        = "3",
        init        = true,
        exclusive   = false,
      --icon        = "~net.png",                 -- Use this icon for the tag (uncomment with a real path)
        screen      = 1,                 
        layout      = awful.layout.suit.tile,      -- Use the max layout
        exec_once   = {"firefox"},
    } ,
    {
        --messageing
        name        = "4",
        init        = true,
        exclusive   = false,
        screen      = 1,            
        layout      = awful.layout.suit.max,      -- Use the max layout
        -- run_app.bin commands are bash scripts that run a application if it
        -- is not already running. This is needed for elctron apps which do
        -- not set the WM class properly and therefore do not work well with
        -- exec_once
        exec_once   = {"run_slack.bin", "thunderbird", "run_discord.bin"},
    } ,
    {
        --anki
        name        = "5",
        init        = true,
        exclusive   = false,
        screen      = 1,                  -- Create this tag on screen 1 and screen 2
        layout      = awful.layout.suit.tile,      -- Use the max layout
        exec_once   = {"run_anki.bin"},
    } ,
    {
        --music
        name        = "6",
        init        = true,
        exclusive   = false,
        screen      = 1,
        layout      = awful.layout.suit.max,
        exec_once   = {"run_spotify"},
    } ,
}

-- Ignore the tag "exclusive" property for the following clients (matched by classes)
tyrannical.properties.intrusive = {
    "ksnapshot"     , "pinentry"       , "gtksu"     , "kcalc"        , "xcalc"               ,
    "feh"           , "Gradient editor", "About KDE" , "Paste Special", "Background color"    ,
    "kcolorchooser" , "plasmoidviewer" , "Xephyr"    , "kruler"       , "plasmaengineexplorer",
}

-- Ignore the tiled layout for the matching clients
tyrannical.properties.floating = {
    "MPlayer"      , "pinentry"        , "ksnapshot"  , "pinentry"     , "gtksu"          ,
    "xine"         , "feh"             , "kmix"       , "kcalc"        , "xcalc"          ,
    "yakuake"      , "Select Color$"   , "kruler"     , "kcolorchooser", "Paste Special"  ,
    "New Form"     , "Insert Picture"  , "kcharselect", "mythfrontend" , "plasmoidviewer"
}

-- Make the matching clients (by classes) on top of the default layout
tyrannical.properties.ontop = {
    "Xephyr"       , "ksnapshot"       , "kruler"
}

-- Force the matching clients (by classes) to be centered on the screen on init
tyrannical.properties.placement = {
    kcalc = awful.placement.centered
}

tyrannical.settings.block_children_focus_stealing = true --Block popups ()
tyrannical.settings.group_children = true --Force popups/dialogs to have the same tags as the parent client



-- ============================================================================
-- startup applications
--awful.spawn.single_instance("spotify", { tag = "", switch_to_tags = false, no_autofocus = true } )
--awful.spawn.single_instance("discord", { tag = "", switch_to_tags = false, no_autofocus = true} )
--awful.spawn.single_instance("thunderbird", { tag = "", switch_to_tags = false, no_autofocus = true } )
--awful.spawn.single_instance("slack", { tag = "", switch_to_tags = false, no_autofocus = true } )
--awful.spawn.single_instance("firefox", { tag = "", switch_to_tags = false, no_autofocus = true } )
--awful.spawn.single_instance("anki", { tag = "", switch_to_tags = false, no_autofocus = true } )
--awful.spawn.single_instance("URxvt", { tag = "", switch_to_tags = false, no_autofocus = true } )


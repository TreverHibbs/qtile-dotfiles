
    local l = awful.layout.suit  -- Just to save some typing: use an alias.
    local layouts = { l.tile, l.tile, l.tile, l.tile, l.tile,
        l.tile, l.tile, l.tile, l.tile }

    local names = { "main", "browser", "messaging", "terminal", "5", " ZOOM", "7", "8", "music" }
    if s.index == 1 then
        names = { "1", "2", "3", "4", "5", "6", "7", "8", "9" }
    else 
        names = { "1", "2", "3", "4", "5", "6", "7", "8", "9" }
        layouts = { l.tile.left, l.tile.left, l.tile.left, l.tile.left, l.tile.left,
            l.tile.left, l.tile.left, l.tile.left, l.tile.left }
    end

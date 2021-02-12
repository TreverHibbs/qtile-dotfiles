local awful = require("awful")
local wibox = require("wibox")
local beautiful = require("beautiful")

-- Get theme variables
local focused_client_color = beautiful.fg_normal or "#1D8CD2"





-- ============================================================================
local current_client = wibox.widget{
    text = "current_client widget",
    align = 'center',
    valign = 'center',
    widget = wibox.widget.textbox
}
-- ============================================================================
local function update_widget()
    local c = client.focus
    local focused_client_name = c.name or "uwu"
    local name_max = beautiful.wibar_max_name_len

    if string.len(focused_client_name) > name_max then
        focused_client_name = string.sub(focused_client_name, 1, name_max)
        focused_client_name = focused_client_name .. "..."
    end

    current_client.markup = 
        "<span foreground='" .. focused_client_color .."'>"
        .. focused_client_name .. "</span>"
end
-- ============================================================================
client.connect_signal("focus", function(c)
    update_widget()
end)
-- ============================================================================
return current_client


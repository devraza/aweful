local awful = require("awful")
local beautiful = require("beautiful")

volume =
    awful.widget.watch(
    "pamixer --get-volume-human",
    0.05,
    function(widget, stdout)
        local volume = string.match(stdout, "muted") or stdout:gsub("%s+", "")
        if volume == "muted" then
            widget:set_markup("<span color='" .. beautiful.negative .. "'>mut</span>")
        else
            widget:set_markup(volume:gsub("%%", ""))
        end
    end
)

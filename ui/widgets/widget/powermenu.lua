local wibox = require("wibox")
local awful = require("awful")
local beautiful = require("beautiful")
local naughty = require("naughty")

powermenu =
    wibox.widget {
    font = beautiful.icon_font,
    markup = '<span color="' .. secondary .. '"> \u{f011}</span>',
    align = "center",
    valign = "center",
    halign = "center",
    buttons = {
        awful.button(
            {},
            1,
            nil,
            function()
                os.execute("sudo poweroff")
                notify("Shutting down", "Powering off now...")
            end
        ),
        awful.button(
            {},
            3,
            nil,
            function()
                os.execute("sudo reboot")
                notify("Rebooting", "Rebooting now...")
            end
        )
    },
    widget = wibox.widget.textbox
}

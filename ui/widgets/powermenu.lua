local wibox = require("wibox")
local awful = require("awful")
local beautiful = require("beautiful")
local naughty = require("naughty")

powermenu =
    wibox.widget {
    font = beautiful.icon_font,
    markup = '<span color="' .. beautiful.negative .. '"> \u{f011}</span>',
    align = "center",
    valign = "center",
    halign = "center",
    buttons = {
        awful.button(
            {},
            1,
            nil,
            function()
	       notify("Shutting down", "Powering off now...")
	       os.execute("sudo poweroff")
            end
        ),
        awful.button(
            {},
            3,
            nil,
            function()
                notify("Rebooting", "Rebooting now...")
                os.execute("sudo reboot")
            end
        )
    },
    widget = wibox.widget.textbox
}

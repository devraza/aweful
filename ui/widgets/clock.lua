local wibox = require("wibox")
local beautiful = require("beautiful")
local awful = require("awful")

clock = wibox.widget.background()
clock:set_widget(wibox.widget.textclock("%I:%M %p"))
clock:set_fg(beautiful.secondary)

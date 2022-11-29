local wibox = require("wibox")
local beautiful = require("beautiful")
local awful = require("awful")

clock = wibox.widget.background()
clock:set_widget(wibox.widget.textclock("%H\n%M"))
clock:set_fg(beautiful.secondary)

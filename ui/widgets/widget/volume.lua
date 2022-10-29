local awful = require("awful")
local wibox = require("wibox")

volume = awful.widget.watch("pamixer --get-volume", 0.05)

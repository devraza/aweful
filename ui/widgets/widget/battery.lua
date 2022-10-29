local awful = require("awful")
local lain = require("lain")

battery =
    lain.widget.bat {
    settings = function()
        widget:set_markup('<span color="' .. primary .. '"><b>' .. bat_now.perc .. "</b></span>")
        bat_notification_charged_preset = {
            border_color = "#11111b",
            border_width = 15,
            bg = "#11111b",
            timeout = 5,
            title = '<span color="' .. positive .. '"><b>Battery full charged!</b></span>',
            text = "You can now unplug the cable."
        }
        bat_notification_low_preset = {
            border_color = "#11111b",
            border_width = 15,
            bg = "#11111b",
            timeout = 5,
            title = '<span color="' .. secondary .. '"><b>Battery low!</b></span>',
            text = "Plug in the cable."
        }
        bat_notification_critical_preset = {
            border_color = "#11111b",
            border_width = 15,
            timeout = 5,
            bg = "#11111b",
            title = '<span color="' .. secondary .. '"><b>Battery critical!</b></span>',
            text = "Impending doom approaches!."
        }
    end,
    batteries = {"BAT1", "BAT2"}
}

battery_icon = icon("\u{f240}")

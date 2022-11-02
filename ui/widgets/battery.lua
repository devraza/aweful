local awful = require("awful")
local lain = require("lain")
local beautiful = require("beautiful")

battery =
    lain.widget.bat {
    settings = function()
        widget:set_markup('<span color="' .. beautiful.primary .. '"><b>' .. bat_now.perc .. "</b></span>")
        bat_notification_charged_preset = {
            border_color = beautiful.bg_normal,
            border_width = 15,
            bg = beautiful.bg_normal,
            timeout = 5,
            title = '<span color="' .. beautiful.positive .. '"><b>Battery full charged!</b></span>',
            text = "You can now unplug the cable."
        }
        bat_notification_low_preset = {
            border_color = beautiful.bg_normal,
            border_width = 15,
            bg = beautiful.bg_normal,
            timeout = 5,
            title = '<span color="' .. beautiful.negative .. '"><b>Battery low!</b></span>',
            text = "Plug in the cable."
        }
        bat_notification_critical_preset = {
            border_color = beautiful.bg_normal,
            border_width = 15,
            timeout = 5,
            bg = beautiful.bg_normal,
            title = '<span color="' .. beautiful.negative .. '"><b>Battery critical!</b></span>',
            text = "Impending doom approaches!."
        }
    end,
    batteries = {"BAT1", "BAT2"}
}

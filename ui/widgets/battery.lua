local awful = require("awful")
local lain = require("lain")
local beautiful = require("beautiful")
local dpi = beautiful.xresources.apply_dpi

battery =
    lain.widget.bat {
    settings = function()
       widget:set_markup(colourise("Battery:\n", beautiful.primary) .. '<span color="' .. beautiful.text .. '"><b>' .. bat_now.perc .. "%</b></span>")
        bat_notification_charged_preset = {
            bg = beautiful.bg_normal,
            timeout = 5,
            title = '<span color="' .. beautiful.positive .. '"><b>Battery full charged!</b></span>',
            text = "You can now unplug the cable."
        }
        bat_notification_low_preset = {
            bg = beautiful.bg_normal,
            timeout = 5,
            title = '<span color="' .. beautiful.negative .. '"><b>Battery low!</b></span>',
            text = "Plug in the cable."
        }
        bat_notification_critical_preset = {
            timeout = 5,
            bg = beautiful.bg_normal,
            title = '<span color="' .. beautiful.negative .. '"><b>Battery critical!</b></span>',
            text = "Impending doom approaches!."
        }
    end,
    notify = "off",
    batteries = {"BAT1", "BAT2"}
}

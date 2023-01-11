local wibox = require("wibox")
local beautiful = require("beautiful")
local awful = require("awful")
local naughty = require("naughty")
local dpi = beautiful.xresources.apply_dpi

function colourise(text, fg)
    if fg == "" then
        fg = beautiful.primary
    end
    return "<span foreground='" .. fg .. "'>" .. text .. "</span>"
end

function icon(code, colour, size, but)
    return wibox.widget {
        font = beautiful.icon_font_sizeable .. " " .. size,
        markup = "<span color='" .. colour .. "'>" .. code .. "</span>",
        align = "center",
        valign = "center",
	buttons = but,
        widget = wibox.widget.textbox,
    }
end

function text(text, size, colour)
    return wibox.widget {
        font = beautiful.font_sizeable .. "" .. size,
        markup = '<span color="' .. colour .. '">' .. text .. "</span>",
        align = "center",
        valign = "center",
        halign = "center",
        widget = wibox.widget.textbox
    }
end

function distext(text)
    return wibox.widget {
        font = beautiful.font,
        markup = '<span color="' .. beautiful.disabled .. '">' .. text .. "</span>",
        widget = wibox.widget.textbox
    }
end

function notify(title, description, outtime)
    return naughty.notify {
        border_color = beautiful.bg_normal,
	timeout = outtime,
        bg = beautiful.bg_normal,
        title = '<span color="' .. beautiful.tertiary .. '"><b>' .. title .. "</b></span>",
        text = description
    }
end

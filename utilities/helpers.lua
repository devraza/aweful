local wibox = require("wibox")
local beautiful = require("beautiful")
local naughty = require("naughty")

function colourise(text, fg)
    if fg == "" then
        fg = beautiful.primary
    end
    return " <span foreground='" .. fg .. "'>" .. text .. "</span>"
end

function icon_colourise(colour, code)
    return wibox.widget {
        font = beautiful.icon_font,
        markup = ' <span color="' .. colour .. '">' .. code .. "</span>",
        align = "center",
        valign = "center",
        widget = wibox.widget.textbox
    }
end

function icon(code)
    return wibox.widget {
        font = beautiful.icon_font,
        markup = ' <span color="' .. beautiful.primary .. '">' .. code .. "</span>",
        align = "center",
        valign = "center",
        widget = wibox.widget.textbox
    }
end

function text_size(text, size, colour)
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

function notify(title, description)
    return naughty.notification {
        border_color = beautiful.bg_normal,
        border_width = 10,
        fg = text,
        bg = beautiful.bg_normal,
        title = '<span color="' .. beautiful.tertiary .. '"><b>' .. title .. "</b></span>",
        text = description
    }
end

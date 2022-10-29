local wibox = require("wibox")
local beautiful = require("beautiful")

function colourise(txt, fg)
    if fg == "" then
        fg = beautiful.primary
    end
    return " <span foreground='" .. fg .. "'>" .. txt .. "</span>"
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
        markup = ' <span color="' .. primary .. '">' .. code .. "</span>",
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
        markup = '<span color="' .. "#4e5173" .. '">' .. text .. "</span>",
        widget = wibox.widget.textbox
    }
end

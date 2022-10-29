local ruled = require("ruled")
local awful = require("awful")
local naughty = require("naughty")

ruled.notification.connect_signal(
    "request::rules",
    function()
        -- All notifications will match this rule.
        ruled.notification.append_rule {
            rule = {},
            properties = {
                screen = awful.screen.preferred,
                implicit_timeout = 5
            }
        }
    end
)

naughty.connect_signal(
    "request::display",
    function(n)
        naughty.layout.box {notification = n}
    end
)

function notify(title, description)
    return naughty.notification {
        border_color = "#11111b",
        border_width = 10,
        fg = text,
        bg = "#11111b",
        title = '<span color="' .. tertiary .. '"><b>' .. title .. "</b></span>",
        text = description
    }
end

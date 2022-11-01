local ruled = require("ruled")
local awful = require("awful")
local naughty = require("naughty")
local beautiful = require("beautiful")

-- Notificaton on errors
naughty.connect_signal(
    "request::display_error",
    function(message, startup)
        naughty.notification {
            urgency = "critical",
            title = "An error occured" .. (startup and " during startup"),
            message = message
        }
    end
)

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

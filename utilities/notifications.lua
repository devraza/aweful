local ruled = require("ruled")
local awful = require("awful")
local lain = require("lain")
local naughty = require("naughty")
local beautiful = require("beautiful")
local dpi = beautiful.xresources.apply_dpi

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

-- Enable notifications
ruled.notification.connect_signal(
    "request::rules",
    function()
        -- All notifications will match this rule.
        ruled.notification.append_rule {
            rule = {},
            properties = {
                screen = awful.screen.preferred,
                implicit_timeout = 5,
            }
        }
    end
)

naughty.connect_signal (
   "request::display", function(n)
      n.title = string.format("<span color = '" .. beautiful.secondary .. "'>%s</span>", n.title)
      n.margin = dpi(15)
      naughty.layout.box {
	 notification = n,
      }
end)

-- MPD Notifications
mpd_widget =
    lain.widget.mpd {
    timeout = 1,
    settings = function()
        mpd_notification_preset = {
	   bg = beautiful.bg_normal,
	   timeout = 1,
	   fg = beautiful.text,
	   title = '<span color="' .. beautiful.tertiary .. '"><b>' .. "Now playing" .. "</b></span>",
	   text = mpd_now.title .. " - " .. mpd_now.artist
        }
    end
}

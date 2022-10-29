local awful = require('awful')
local beautiful = require('beautiful')
local wibox = require('wibox')

-- Wallpaper
screen.connect_signal('request::wallpaper', function(s)
  awful.wallpaper {
    screen = s,
    widget = {
      image = beautiful.wallpaper,
      valign = 'center',
      halign = 'center',
      resize = false,
      widget = wibox.widget.imagebox,
    }
  }
end)

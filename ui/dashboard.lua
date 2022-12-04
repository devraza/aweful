local awful = require("awful")
local wibox = require("wibox")
local gears = require("gears")
local beautiful = require("beautiful")
local dpi = beautiful.xresources.apply_dpi

dashboard = awful.popup {
   widget = {
      {
	 {
	    {
	       forced_height = dpi(70),
	       forced_width = dpi(100),
	    widget = wibox.container.background(wibox.container.place(volume))
	    },
	    bg = beautiful.bg_light,
	    clip = true,
	    widget = wibox.container.background
	 },
	 {
	    {
	       forced_height = dpi(70),
	       forced_width = dpi(100),
	       widget = wibox.container.background(wibox.container.place(battery))
	    },
	    bg = beautiful.bg_light,
	    clip = true,
	    widget = wibox.container.background
	 },
	 spacing = dpi(16),
	 layout = wibox.layout.fixed.vertical,
      },
      {
	 {
	    forced_height = dpi(240),
	    forced_width = dpi(220),
	    widget = wibox.container.place(calendar_widget)
	 },
	 bg = beautiful.bg_light,
	 clip = true,
	 widget = wibox.container.background
      },
      {
	 {
	    {
	       {
		  forced_height = dpi(60),
		  forced_width = dpi(60),
		  widget = icon("\u{f023}", beautiful.tertiary, 20, {
				   	   awful.button({}, 1, nil, function ()
						 awful.spawn(locker)
					   end)
		  })
	       },
	       bg = beautiful.bg_light,
	       clip = true,
	       widget = wibox.container.background
	    },
	    {
	       {
		  forced_height = dpi(60),
		  forced_width = dpi(60),
		  widget = icon("\u{f011}", beautiful.negative, 20, {
				   awful.button({}, 1, nil, function ()
					 awful.spawn("sudo poweroff")
				   end),
				   awful.button({}, 3, nil, function ()
					 awful.spawn("sudo reboot")
				   end)
		  })
	       },
	       bg = beautiful.bg_light,
	       clip = true,
	       widget = wibox.container.background
	    },
	    spacing = dpi(16),
	    layout = wibox.layout.fixed.vertical,
	 },
	 {
	    {
	       {
		  forced_height = dpi(60),
		  forced_width = dpi(60),
		  widget = icon("\u{f565}", beautiful.primary, 20, {
				   awful.button({}, 1, nil, function ()
					 delayed_screenshot {
					    auto_save_delay = 5,
					    file_path = screenshot_path .. os.date("%d.%m.%Y-%H:%M:%S") .. ".png",

					 }
				   end)
		  })
	    },
	       bg = beautiful.bg_light,
	       clip = true,
	       widget = wibox.container.background
	    },
	    spacing = dpi(16),
	    layout = wibox.layout.fixed.vertical,
	 },
	 spacing = dpi(16),
	 layout = wibox.layout.fixed.horizontal,
      },
      spacing = dpi(16),
      layout = wibox.layout.fixed.horizontal,
   },
   border_width = dpi(16),
   border_color = beautiful.bg_normal,
   placement = awful.placement.centered,
   ontop = true,
   visible = false,
}

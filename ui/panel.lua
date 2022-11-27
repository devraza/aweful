local awful = require("awful")
local wibox = require("wibox")
local beautiful = require("beautiful")
local dpi = beautiful.xresources.apply_dpi
local naughty = require("naughty")
local gears = require("gears")

--- Wibar ---
screen.connect_signal(
    "request::desktop_decoration",
    function(s)
        -- Each screen has its own tag table.
        local names = {"1", "2", "3", "4", "5"}
        local l = awful.layout.suit
        local layouts = {l.tile, l.tile, l.tile, l.tile, l.floating}
        awful.tag(names, s, layouts)

        -- Prompt
        s.prompt = awful.widget.prompt()

        local layoutbox =
            awful.widget.layoutbox {
            screen = s,
            forced_width = dpi(20),
            -- Add buttons, allowing you to change the layout
            buttons = {
                awful.button(
                    {},
                    1,
                    function()
                        awful.layout.inc(1)
                    end
                ),
                awful.button(
                    {},
                    3,
                    function()
                        awful.layout.inc(-1)
                    end
                ),
                awful.button(
                    {},
                    4,
                    function()
                        awful.layout.inc(1)
                    end
                ),
                awful.button(
                    {},
                    5,
                    function()
                        awful.layout.inc(-1)
                    end
                )
            }
        }

        -- Layout icon
        s.layout =
            awful.widget.layoutbox {
            screen = s,
            buttons = {
                awful.button(
                    {},
                    1,
                    function()
                        awful.layout.inc(1)
                    end
                ),
                awful.button(
                    {},
                    3,
                    function()
                        awful.layout.inc(-1)
                    end
                ),
                awful.button(
                    {},
                    4,
                    function()
                        awful.layout.inc(-1)
                    end
                ),
                awful.button(
                    {},
                    5,
                    function()
                        awful.layout.inc(1)
                    end
                )
            }
        }

        -- Create a taglist widget
        s.taglist =
            awful.widget.taglist {
            screen = s,
            filter = awful.widget.taglist.filter.all,
            buttons = {
                awful.button(
                    {},
                    1,
                    function(t)
                        t:view_only()
                    end
                ),
                awful.button(
                    {modkey},
                    1,
                    function(t)
                        if client.focus then
                            client.focus:move_to_tag(t)
                        end
                    end
                ),
                awful.button({}, 3, awful.tag.viewtoggle),
                awful.button(
                    {modkey},
                    3,
                    function(t)
                        if client.focus then
                            client.focus:toggle_tag(t)
                        end
                    end
                ),
                awful.button(
		   {},
                    4,
                    function(t)
		       awful.tag.viewprev(t.screen)
                    end
                ),
                awful.button(
		   {},
                    5,
                    function(t)
		       awful.tag.viewnext(t.screen)
                    end
                )
            }
	    }
	 
	 s.top_panel =
            awful.wibar {
	       position = "bottom",
	       height = dpi(35),
	       screen = s,
	       widget = {
		  layout = wibox.layout.align.horizontal,
		  {
		     -- Top widgets
		     wibox.container.margin(s.taglist, dpi(8)),
		     layout = wibox.layout.fixed.horizontal
                }, -- Center widget
		  wibox.container.place(),
		  {
		     -- Bottom widgets
		     layout = wibox.layout.fixed.horizontal,
		     wibox.container.margin(volume, dpi(14)),
		     wibox.container.margin(clock, dpi(14)),
		     wibox.container.margin(wibox.container.place(layoutbox), dpi(14), dpi(10)),
		  }
	       }
	    }
    end
)

local awful = require("awful")
local hotkeys_popup = require("awful.hotkeys_popup")
local naughty = require("naughty")
local beautiful = require("beautiful")

--- Keybindings ---
-- The defaults
client.connect_signal(
    "request::default_keybindings",
    function()
        awful.keyboard.append_client_keybindings(
	   {
	      awful.key(
		 { modkey },
		 "f",
		 function(c)
		    c.fullscreen = not c.fullscreen
		    c:raise()
		 end,
		 { description = "Toggle fullscreen", group = "Client" }
	      ),
	      awful.key(
		 { modkey, "Shift" },
		 "c",
		 function(c)
		    c:kill()
		 end,
		 { description = "Close client", group = "Client" }
	      ),
	      awful.key(
		 { modkey },
		 "w",
		 awful.client.floating.toggle,
		 { description = "Toggle floating", group = "Client" }
	      ),
	      awful.key(
		 { modkey, "Shift" },
		 "Return",
		 function(c)
		    c:swap(awful.client.getmaster())
		 end,
		 { description = "Move to top", group = "Client" }
	      ),
	      awful.key(
		 {modkey},
		 "o",
		 function(c)
		    c:move_to_screen()
		 end,
		 {description = "Move to screen", group = "Client"}
	      ),
	      awful.key(
		 {modkey},
		 "n",
		 function(c)
		    c.minimized = true
		 end,
		 {description = "Minimize", group = "Client"}
	      ),
	      awful.key(
		 {modkey},
		 "m",
		 function(c)
		    c.maximized = not c.maximized
		    c:raise()
		 end,
		 {description = "Maximize", group = "Client"}
	      ),
	      awful.key(
		 {modkey, "Control"},
		 "m",
		 function(c)
		    c.maximized_vertical = not c.maximized_vertical
		    c:raise()
		 end,
		 {description = "Maximize vertically", group = "Client"}
	      ),
	      awful.key(
		 {modkey, "Shift"},
		 "m",
		 function(c)
		    c.maximized_horizontal = not c.maximized_horizontal
		    c:raise()
		 end,
		 {description = "Maximize horizontally", group = "Client"}
	      )
	   }
        )
    end
)

-- AwesomeWM keybinds
awful.keyboard.append_global_keybindings(
   {
      awful.key({modkey}, "s", hotkeys_popup.show_help, {description = "Show help", group = "Awesome"}),
      awful.key({modkey, "Shift"}, "r", awesome.restart, {description = "Reload", group = "Awesome"}),
      awful.key({modkey, "Shift"}, "q", awesome.quit, {description = "Quit", group = "Awesome"}),
      awful.key(
	 { modkey },
	 "q",
	 function ()
	    if dashboard.visible == false then
	       dashboard.visible = true
	    else
	       dashboard.visible = false
	    end
	 end,
	 { description = "Toggle Dashboard", group = "Awesome" }
      ),
      awful.key(
	 { modkey },
	 "t",
	 function ()
	    scratch:toggle()
	 end,
	 { description = "Toggle Scratchpad", group = "Awesome" }
      ),
      awful.key(
	 {modkey},
	 "Return",
	 function()
	    awful.spawn(terminal)
	 end,
	 {description = "Terminal", group = "Awesome"}
      ),

      -- Audio control, using pamixer. Supports PipeWire PulseAudio server
      awful.key(
	 {modkey, "Control"},
	 "j",
	 function()
	    awful.spawn("pamixer -d 10")
	    awful.spawn.easy_async_with_shell("pamixer --get-volume-human", function(stdout)
						 notify("Volume", stdout:gsub("\n[^\n]*$", ""), 0.6)
	    end)
	 end,
	 {description = "Volume -10%", group = "Volume"}
      ),
      awful.key(
	 {modkey, "Control"},
	 "k",
	 function()
	    awful.spawn("pamixer -i 10")
	    awful.spawn.easy_async_with_shell("pamixer --get-volume-human", function(stdout)
						 notify("Volume", stdout:gsub("\n[^\n]*$", ""), 0.6)
	    end)
	 end,
	 {description = "Volume +10%", group = "Volume"}
      ),
      awful.key(
	 {modkey, "Control"},
	 "l",
	 function()
	    awful.spawn("pamixer -t")
	    awful.spawn.easy_async_with_shell("pamixer --get-volume-human", function(stdout)
						 notify("Volume", stdout:gsub("\n[^\n]*$", ""), 0.6)
	    end)
	 end,
	 {description = "Toggle mute", group = "Volume"}
      ),
      awful.key (
	 { modkey, "Control", "Shift" },
	 "a",
	 function()
	    awful.spawn.with_shell("sudo poweroff")
	 end,
	 { description = "Poweroff", group = "Powermenu" }),
      awful.key (
	 { modkey, "Control", "Shift" },
	 "s",
	 function()
	    awful.spawn.with_shell("sudo reboot")
	 end,
	 { description = "Reboot", group = "Powermenu" }),

      -- Rofi
      awful.key(
	 {modkey},
	 "space",
	 function()
	    awful.spawn("rofi -show drun -dpi 96")
	 end,
	 {description = "Launch Application", group = "Rofi"}
      ),
      awful.key(
	 {modkey, "Shift"},
	 "space",
	 function()
	    awful.spawn("rofi -show run -dpi 96")
	 end,
	 {description = "Run Command", group = "Rofi"}
      ),

      -- MPC
      awful.key(
	 { "Mod1", "Shift"},
	 "h",
	 function()
	    awful.spawn("mpc prev")
	 end,
	 { description = "Previous track", group = "MPD" }
      ),
      awful.key(
	 { "Mod1", "Shift"},
	 "j",
	 function()
	    awful.spawn("mpc pause")
	 end,
	 { description = "Pause track", group = "MPD" }
      ),
      awful.key(
	 { "Mod1", "Shift"},
	 "k",
	 function()
	    awful.spawn("mpc play")
	 end,
	 { description = "Resume track", group = "MPD" }
      ),
      awful.key(
	 { "Mod1", "Shift"},
	 "l",
	 function()
	    awful.spawn("mpc next")
	 end,
	 { description = "Next track", group = "MPD" }
      ),

     awful.key(
	 { "Mod1", "Shift"},
	 "u",
	 function()
	    awful.spawn("mpc volume -10")
	 end,
	 { description = "Volume -10%", group = "MPD" }
      ),
      awful.key(
	 { "Mod1", "Shift"},
	 "i",
	 function()
	    awful.spawn("mpc volume +10")
	 end,
	 { description = "Volume +10%", group = "MPD" }
      ),

      -- Screenshot
      awful.key(
	 {modkey, "Shift"},
	 "a",
	 function()
	    timestamp = os.date("%d.%m.%Y-%H:%M:%S")
	    awful.spawn.with_shell(
	       "scrot " .. screenshot_path ..
	       timestamp .. ".png -e 'xclip -t image/png -selection clipboard -i $f'"
	    )
	 end,
	 { description = "Capture screen", group = "Screenshot" }
      ),
      awful.key(
	 {modkey, "Shift"},
	 "s",
	 function()
	    timestamp = os.date("%d.%m.%Y-%H:%M:%S") 
	    awful.spawn.with_shell(
	       "scrot -s -f " .. screenshot_path ..
	       timestamp .. ".png -e 'xclip -t image/png -selection clipboard -i $f'"
	    )
	 end,
	 { description = "Capture area", group = "Screenshot" }
      ),
      awful.key(
	 {modkey, "Shift"},
	 "d",
	 function()
	    timestamp = os.date("%d.%m.%Y-%H:%M:%S") 
	    awful.spawn.with_shell(
	       "scrot -u " .. screenshot_path ..
	       timestamp .. ".png -e 'xclip -t image/png -selection clipboard -i $f'"
	    )
	 end,
	 {description = "Capture window", group = "Screenshot"}
      ),

      -- Applications
      awful.key(
	 {modkey},
	 "a",
	 function()
	    awful.spawn(file_manager)
	 end,
	 {description = "File Manager", group = "Applications"}
      ),
      awful.key(
	 {modkey},
	 "x",
	 function()
	    awful.spawn.with_shell(pdf)
	 end,
	 {description = "PDF Viewer", group = "Applications"}
      ),
      awful.key(
	 {modkey},
	 "z",
	 function()
	    awful.spawn(music_player)
	 end,
	 {description = "Music Player", group = "Applications"}
      ),
      awful.key(
	 {modkey},
	 "c",
	 function()
	    awful.spawn(chat)
	 end,
	 {description = "Chat Client", group = "Applications"}
      ),
      awful.key(
	 {modkey},
	 "e",
	 function()
	    awful.spawn(editor)
	 end,
	 {description = "Editor", group = "Applications"}
      ),
      awful.key(
	 {modkey},
	 "b",
	 function()
	    awful.spawn(browser)
	 end,
	 {description = "Browser", group = "Applications"}
      ),
      awful.key(
	 {modkey},
	 "d",
	 function()
	    awful.spawn(monitor)
	 end,
	 {description = "System Monitor", group = "Applications"}
      ),
      awful.key(
	 {modkey, "Shift"},
	 "l",
	 function()
	    awful.spawn(locker)
	 end,
	 {description = "Screen Locker", group = "Applications"}
      ),

      -- Tags related keybindings
      awful.key({modkey}, "Left", awful.tag.viewprev, {description = "Previous tag", group = "Tag"}),
      awful.key({modkey}, "Right", awful.tag.viewnext, {description = "Next tag", group = "Tag"}),
      awful.key({modkey}, "Tab", awful.tag.history.restore, {description = "Alternate tags", group = "Tag"}),

      -- Focus related keybindings
      awful.key(
	 {modkey},
	 "j",
	 function()
	    awful.client.focus.byidx(1)
	 end,
	 {description = "Next client", group = "Client"}
      ),
      awful.key(
	 {modkey},
	 "k",
	 function()
	    awful.client.focus.byidx(-1)
	 end,
	 {description = "Previous client", group = "Client"}
      ),
      awful.key(
	 {modkey},
	 "Escape",
	 function()
	    awful.client.focus.history.previous()
	    if client.focus then
	       client.focus:raise()
	    end
	 end,
	 {description = "Alternate clients", group = "Client"}
      ),
      awful.key(
	 {modkey, "Control", "Mod1"},
	 "k",
	 function()
	    awful.screen.focus_relative(1)
	 end,
	 {description = "Next screen", group = "Screen"}
      ),
      awful.key(
	 {modkey, "Control", "Mod1"},
	 "j",
	 function()
	    awful.screen.focus_relative(-1)
	 end,
	 {description = "Previous screen", group = "Screen"}
      ),
      awful.key(
	 {modkey, "Shift"},
	 "n",
	 function()
	    local c = awful.client.restore()
	    -- Focus restored client
	    if c then
	       c:activate {raise = true, context = "key.unminimize"}
	    end
	 end,
	 {description = "Unminimize", group = "Client"}
      ),

      -- Layout related keybindings
      awful.key(
	 {modkey, "Shift"},
	 "j",
	 function()
	    awful.client.swap.byidx(1)
	 end,
	 {description = "Swap next client", group = "Client"}
      ),
      awful.key(
	 {modkey, "Shift"},
	 "k",
	 function()
	    awful.client.swap.byidx(-1)
	 end,
	 {description = "Swap previous client", group = "Client"}
      ),
      awful.key({modkey}, "u", awful.client.urgent.jumpto, {description = "Urgent client", group = "Client"}),
      awful.key(
	 {modkey},
	 "l",
	 function()
	    awful.tag.incmwfact(0.05)
	 end,
	 {description = "Increase width", group = "Layout"}
      ),
      awful.key(
	 {modkey},
	 "h",
	 function()
	    awful.tag.incmwfact(-0.05)
	 end,
	 {description = "Decrease width", group = "Layout"}
      ),
      awful.key(
	 {modkey},
	 "i",
	 function()
	    awful.layout.inc(1)
	 end,
	 {description = "Next layout", group = "Layout"}
      ),
      awful.key(
	 {modkey},
	 "u",
	 function()
	    awful.layout.inc(-1)
	 end,
	 {description = "Previous layout", group = "Layout"}
      ),

      awful.key {
	 modifiers = {modkey},
	 keygroup = "numrow",
	 description = "Go to tag",
	 group = "Tag",
	 on_press = function(index)
	    local screen = awful.screen.focused()
	    local tag = screen.tags[index]
	    if tag then
	       tag:view_only()
	    end
	 end
      },
      awful.key {
	 modifiers = {modkey, "Shift"},
	 keygroup = "numrow",
	 description = "Client to tag",
	 group = "Tag",
	 on_press = function(index)
	    if client.focus then
	       local tag = client.focus.screen.tags[index]
	       if tag then
		  client.focus:move_to_tag(tag)
	       end
	    end
	 end
      },
   }
)

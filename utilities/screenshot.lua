local naughty = require("naughty")
local awful = require("awful")
local dpi = require("beautiful").xresources.apply_dpi

function saved_screenshot(args)
    local ss = awful.screenshot(args)

    local function notify_screenshot(self)
        naughty.notification {
            title = "Screenshot Saved",
            message = self.file_path,
        }
    end

    if args.auto_save_delay == 0 then
       notify_screenshot(ss)
    else
       ss:connect_signal("file::saved", notify_screenshot)
    end

    return ss
end

function delayed_screenshot(args)
    local ss = saved_screenshot(args)
    local notif = naughty.notification {
        title = "Screenshot in:",
        message = tostring(args.auto_save_delay) .. " seconds",
	timeout = 2,
    }

    ss:connect_signal("timer::timeout", function()
			 notif:destroy()
    end)

    ss:connect_signal("timer::tick", function(_, remain)
			 if remain > 1 then
			    notif.message = tostring(remain) .. " seconds"
			 else
			    notif:destroy()
			 end
    end)

    return ss 
end

awful.keyboard.append_client_keybindings({
      awful.key({ modkey, "Shift" }, "w",
	 function (c) saved_screenshot {
	       file_path = screenshot_path .. os.date("%d.%m.%Y-%H:%M:%S") .. ".png",
	       auto_save_delay = 0,
	       client = c,
	 } end,
	 { description = "Capture window", group = "Screenshot" }),
})

awful.keyboard.append_global_keybindings({
        awful.key({ modkey, "Shift" }, "a",
	   function () saved_screenshot {
		 auto_save_delay = 0,
		 file_path = screenshot_path .. os.date("%d.%m.%Y-%H:%M:%S") .. ".png",
	   } end,
	   { description = "Capture screen", group = "Screenshot" }),
	awful.key({ modkey, "Shift" }, "s",
	   function () saved_screenshot {
		 file_path = screenshot_path .. os.date("%d.%m.%Y-%H:%M:%S") .. ".png",
		 interactive = true,
		 auto_save_delay = 0,
	   } end,
	   { description = "Interactive Capture", group = "Screenshot" }),
	awful.key({ modkey, "Shift"}, "d",
	   function () delayed_screenshot {
		 auto_save_delay = 5,
		 file_path = screenshot_path .. os.date("%d.%m.%Y-%H:%M:%S") .. ".png",
	   } end,
	   { description = "Capture screen in 5s", group = "Screenshot" }),
})

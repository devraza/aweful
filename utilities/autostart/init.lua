local awful = require("awful")
local gears = require("gears")

--- Autostart ---
awful.spawn.with_shell(gears.filesystem.get_configuration_dir() .. "utilities/scripts/startup.sh")

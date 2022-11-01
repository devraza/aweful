-- Load luarocks if installed, otherwise do nothing
pcall(require, "luarocks.loader")

-- Autofocus and hotkeys_popup
require("awful.hotkeys_popup.keys")
require("awful.autofocus")

-- AwesomeWM modules
local gears = require("gears")
local beautiful = require("beautiful")
local lain = require("lain")
local dpi = require("beautiful.xresources").apply_dpi

-- Initialize theme
beautiful.init(gears.filesystem.get_configuration_dir() .. "ui/theme.lua")

-- MPD Notifications
local mpd =
    lain.widget.mpd {
    timeout = 0.2,
    settings = function()
        mpd_notification_preset = {
            bg = beautiful.bg_normal,
            border_color = beautiful.bg_normal,
            border_width = dpi(10),
            timeout = 1,
            fg = beautiful.text,
            title = '<span color="' .. beautiful.tertiary .. '"><b>' .. "Now playing" .. "</b></span>",
            text = mpd_now.title .. " - " .. mpd_now.artist
        }
    end
}

-- Variables --

terminal = "alacritty"
-- This command will be run directly
editor = "emacsclient -c"
-- Modkey. Can either be Mod4 (Super) or Mod1 (Alt)
modkey = "Mod4"
-- File manager, will be run directly
file_manager = terminal .. " -e ranger"
-- Music player, will be run directly
music_player = terminal .. " -e ncmpcpp"
-- Web browser
browser = "qutebrowser"
-- System monitor
monitor = terminal .. " -e btm"
-- Chat client
chat = terminal .. " -e tiny"

-- User modules
require("utilities")
require("ui")
require("keymaps")

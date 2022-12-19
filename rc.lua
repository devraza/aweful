-- Load luarocks if installed, otherwise do nothing
pcall(require, "luarocks.loader")

-- Autofocus and hotkeys_popup
require("awful.hotkeys_popup.keys")
require("awful.autofocus")

-- AwesomeWM modules
local gears = require("gears")
local beautiful = require("beautiful")
local dpi = require("beautiful.xresources").apply_dpi

-- Initialize theme
beautiful.init(gears.filesystem.get_configuration_dir() .. "ui/theme.lua")

-- Variables --

-- Screenshot directory
screenshot_path = os.getenv("HOME") .. "/Pictures/Screenshots/"
-- Terminal emulator
terminal = "alacritty"
-- Editor. This will be run directly
editor = "emacsclient -c"
-- Modkey. Can either be Mod4 (Super) or Mod1 (Alt)
modkey = "Mod4"
-- File manager, will be run directly
file_manager = terminal .. " -e xplr"
-- Music player, will be run directly
music_player = terminal .. " -e ncmpcpp"
-- Web browser
browser = "qutebrowser"
-- System monitor
monitor = terminal .. " -e btm"
-- Chat client
chat = terminal .. " -e tiny"
-- PDF Viewer
pdf = "zathura"
-- Screen locker
locker = "slock"
-- Colour picker
colour_picker = "xcolor"

-- User modules
require("utilities")
require("ui")
require("keymaps")

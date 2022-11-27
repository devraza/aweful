local theme_assets = require("beautiful.theme_assets")
local xresources = require("beautiful.xresources")
local naughty = require("naughty")
local ruled = require("ruled")
local dpi = xresources.apply_dpi
local xrdb = xresources.get_current_theme()
local gears = require("gears")
local gfs = require("gears.filesystem")
local themes_path = gfs.get_themes_dir()

-- Inherit default theme
local theme = dofile(themes_path .. "default/theme.lua")

-- Custom colours
theme.primary = xrdb.color4
theme.text = xrdb.foreground
theme.secondary = xrdb.color5
theme.tertiary = xrdb.color2
theme.negative = xrdb.color1
theme.positive = xrdb.color3
theme.disabled = xrdb.color8

-- Font and resizable font (append a size as a string)
theme.font = "Iosevka Bold 11.5"
theme.font_sizeable = "Iosevka "

-- Icon font and resizable icon font (appand a size as a string)
theme.icon_font = "Font Awesome 6 Pro 12.5"
theme.icon_font_sizable = "Font Awesome 6 Pro "
theme.icon_color = theme.primary

-- Theme variables
theme.bg_normal = xrdb.background
theme.bg_focus = theme.primary
theme.bg_minimize = xrdb.color8
theme.bg_systray = theme.bg_normal

theme.fg_normal = xrdb.foreground
theme.fg_focus = theme.bg_normal
theme.fg_urgent = theme.bg_normal
theme.fg_minimize = theme.bg_normal

theme.useless_gap = dpi(8)
theme.border_width = dpi(0)

theme.tooltip_fg = theme.fg_normal
theme.tooltip_bg = theme.bg_normal

theme.menu_submenu_icon = themes_path .. "default/submenu.png"
theme.menu_height = dpi(16)
theme.menu_width = dpi(100)

-- Notifications
theme.notification_bg = xrdb.background
theme.notification_border_color = xrdb.background
theme.notification_border_width = dpi(10)

-- Snapping
theme.snap_border_width = 1
theme.snap_bg = theme.secondary

-- Recolor layout icons:
theme = theme_assets.recolor_layout(theme, theme.fg_normal)

-- Define the icon theme for application icons.
theme.icon_theme = nil

-- Generate Awesome icon:
theme.awesome_icon = theme_assets.awesome_icon(theme.menu_height, theme.bg_focus, theme.fg_focus)

-- Taglist colours
theme.taglist_fg_focus = theme.secondary
theme.taglist_bg_focus = "#00000000"
theme.taglist_fg_urgent = "#00000000"
theme.taglist_bg_urgent = theme.secondary

-- Increase spacing between taglist items
theme.taglist_spacing = dpi(6)

-- Tasklist
theme.tasklist_fg_focus = theme.secondary
theme.tasklist_fg_minimize = theme.disabled
theme.tasklist_plain_task_name = true
theme.tasklist_spacing = dpi(10)

-- Disable taglist squares:
local taglist_square_size = dpi(0)
theme.taglist_squares_sel = theme_assets.taglist_squares_sel(taglist_square_size, theme.primary)
theme.taglist_squares_unsel = theme_assets.taglist_squares_unsel(taglist_square_size, theme.primary)

-- Set the wallpaper
theme.wallpaper = gfs.get_configuration_dir() .. "assets/wallpapers/wallpaper.png"

-- Set different colors for urgent notifications.
ruled.notification.connect_signal(
    "request::rules",
    function()
        ruled.notification.append_rule {
            rule = { urgency = "critical" },
            properties = {
	       bg = theme.bg_normal,
	       fg = theme.negative,
	    }
        }
   end
)

-- Return the theme
return theme

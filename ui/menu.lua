local hotkeys_popup = require('awful.hotkeys_popup')
require('awful.hotkeys_popup.keys')
require('awful.autofocus')

-- AwesomeWM modules
local awful = require('awful')
local beautiful = require('beautiful')
local menubar = require('menubar')

-- Menu & Submenu --
menu = {
  { 'Hotkeys', function() hotkeys_popup.show_help(nil, awful.screen.focused()) end },
  { 'Config', editor .. ' ' .. awesome.conffile },
  { 'Restart', awesome.restart },
  { 'Quit', function() awesome.quit() end },
}

mainmenu = awful.menu({ items = {
  { 'Awesome', menu, beautiful.awesome_icon },
  { 'Terminal', terminal }
}})

-- Set terminal for applications which need it
menubar.utils.terminal = terminal



local ruled = require('ruled')
local awful = require('awful')

--- Rules ---
ruled.client.connect_signal('request::rules', function()
  -- All clients will match this rule.
  ruled.client.append_rule {
    id = 'global',
    rule = {},
    properties = {
      focus = awful.client.focus.filter,
      raise = true,
      screen = awful.screen.preferred,
      placement = awful.placement.no_overlap+awful.placement.no_offscreen
    }
  }

  -- Floating clients.
  ruled.client.append_rule {
    id = 'floating',
    rule_any = {
      instance = { 'copyq', 'pinentry' },
      class = {
        'Arandr', 'Blueman-manager', 'Gpick', 'Kruler', 'Sxiv',
        'Tor Browser', 'Wpa_gui', 'veromix', 'xtightvncviewer'
      },
      name = { 'Event Tester', },
      role = { 'AlarmWindow', 'ConfigManager', 'pop-up', }
    },
    properties = { floating = true }
  }

  ruled.client.append_rule {
    rule = { class = 'Gcr-prompter' },
    properties = {
      placement = awful.placement.centered,
      floating = true,
    }
  }
  ruled.client.append_rule {
    rule = { class = 'discord' },
    properties = {
       screen = 1, tag = '5', switch_to_tags = true, floating = true 
    }
  }
  ruled.client.append_rule {
    rule = { class = 'qutebrowser' },
    properties = { screen = 1, tag = '2', switch_to_tags = true }
  }
  ruled.client.append_rule {
    rule = { class = 'zoom' },
    properties = { screen = 1, tag = '6', switch_to_tags = true, floating = true }
  }
end)


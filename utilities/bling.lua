local awful = require("awful")
local bling = require("modules.bling")

-- Bling layouts
tag.connect_signal(
    "request::default_layouts",
    function()
        awful.layout.append_default_layouts(
            {
                bling.layout.centered,
                bling.layout.deck
            }
        )
    end
)

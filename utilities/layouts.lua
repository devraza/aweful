local awful = require("awful")

-- AwesomeWM
tag.connect_signal(
    "request::default_layouts",
    function()
        awful.layout.append_default_layouts(
            {
                awful.layout.suit.tile,
                awful.layout.suit.floating,
                awful.layout.suit.magnifier,
                awful.layout.suit.fair.horizontal
            }
        )
    end
)

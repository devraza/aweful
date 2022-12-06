local bling = require "modules.bling"

scratch = bling.module.scratchpad {
    command = "alacritty --class spad -e tiny",
    rule = { instance = "spad" },
    sticky = true,
    autoclose = true,
    dont_focus_before_close = true,
}

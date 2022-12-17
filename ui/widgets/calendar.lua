local wibox = require "wibox"
local beautiful = require "beautiful"
local dpi = beautiful.xresources.apply_dpi
local styles = {}

styles.month = {
   padding = 10,
}

styles.normal = {
   markup = function(t)
      return "<span font_desc='" .. beautiful.font_sizeable .. " Bold 10" .. "'>" .. t .. "</span>"
   end,
}

styles.focus = {
   fg_color = beautiful.secondary,
   markup = function(t)
      return "<span font_desc='" .. beautiful.font_sizeable .. " Bold 10" .. "'>" .. t .. "</span>"
   end,
}

styles.header = {
   markup = function(t)
      return "<span font_desc='" .. beautiful.font_sizeable .. " Bold 11" .. "'>" .. t .. "</span>"
   end,
}
styles.weekday = {
   markup = function(t)
      return "<span color='" .. beautiful.primary .. "'font_desc='" .. beautiful.font_sizeable .. " Italic 10" .. "'>" .. t .. "</span>"
   end,
}

local function decorate_cell(widget, flag, date)
   if flag == "monthheader" and not styles.monthheader then
      flag = "header"
   end
   local props = styles[flag] or {}
   if props.markup and widget.get_text and widget.set_markup then
      widget:set_markup(props.markup(widget:get_text()))
   end
   -- Change bg color for weekends
   local default_bg = beautiful.bg_normal
   local ret = wibox.widget {
      {
	 widget,
	 margins = (props.padding or 2) + (props.border_width or 0),
	 widget = wibox.container.margin,
      },
      shape = props.shape,
      fg = props.fg_color or beautiful.fg_normal,
      widget = wibox.container.background,
   }
   return ret
end

calendar_widget = wibox.widget {
   date = os.date "*t",
   spacing = dpi(8),
   fn_embed = decorate_cell,
   widget = wibox.widget.calendar.month,
}

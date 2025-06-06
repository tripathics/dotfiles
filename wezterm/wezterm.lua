local wezterm = require("wezterm")

local config = wezterm.config_builder()

config.enable_wayland = false

config.font = wezterm.font("BlexMono Nerd Font Mono")
config.font_size = 14
config.line_height = 1.05

config.window_decorations = "RESIZE"
config.hide_tab_bar_if_only_one_tab = true

config.window_padding = {
	left = 0,
	right = 0,
	top = 0,
	bottom = 0,
}
config.window_background_opacity = 0.85

config.color_scheme = "carbonfox"

return config

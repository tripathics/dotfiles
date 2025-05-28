local wezterm = require("wezterm")

local config = wezterm.config_builder()

config.font = wezterm.font("BlexMono Nerd Font Mono")
config.font_size = 14

config.window_decorations = "RESIZE"

config.window_padding = {
	left = 0,
	right = 0,
	top = 0,
	bottom = 0,
}

config.color_scheme = "carbonfox"

return config

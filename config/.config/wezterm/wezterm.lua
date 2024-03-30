-- Pull in the wezterm API
local wezterm = require("wezterm")

-- This table will hold the configuration.
local config = {}

-- In newer versions of wezterm, use the config_builder which will
-- help provide clearer error messages
if wezterm.config_builder then
	config = wezterm.config_builder()
end

-- This is where you actually apply your config choices

-- For example, changing the color scheme:
config.color_scheme = "Gruvbox Material (Gogh)"
config.font = wezterm.font("ComicCodeLigatures Nerd Font")
-- config.font = wezterm.font("Hack")
config.font_size = 14.0
config.front_end = "WebGpu"
config.tab_bar_at_bottom = true
config.enable_wayland = false

-- and finally, return the configuration to wezterm
return config

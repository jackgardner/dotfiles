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
local function is_vim(pane)
	local is_vim_env = pane:get_user_vars().IS_NVIM == "true"
	if is_vim_env == true then
		return true
	end
	-- This gsub is equivalent to POSIX basename(3)
	-- Given "/foo/bar" returns "bar"
	-- Given "c:\\foo\\bar" returns "bar"
	local process_name = string.gsub(pane:get_foreground_process_name(), "(.*[/\\])(.*)", "%2")
	return process_name == "nvim" or process_name == "vim"
end

--- cmd+keys that we want to send to neovim.
local super_vim_keys_map = {
	s = utf8.char(0xAA),
	p = utf8.char(0xAB),
	P = utf8.char(0xAC),
	F = utf8.char(0xAD),
}

local function bind_super_key_to_vim(key)
	return {
		key = key,
		mods = "CMD",
		action = wezterm.action_callback(function(win, pane)
			local char = super_vim_keys_map[key]
			if char then
				-- pass the keys through to vim/nvim
				win:perform_action({
					SendKey = { key = char, mods = nil },
				}, pane)
			else
				win:perform_action({
					SendKey = {
						key = key,
						mods = "CMD",
					},
				}, pane)
			end
		end),
	}
end
-- For example, changing the color scheme:
config.color_scheme = "Gruvbox Material (Gogh)"
config.disable_default_key_bindings = true
config.font = wezterm.font("ComicCodeLigatures Nerd Font")
-- config.font = wezterm.font("Hack")
config.font_size = 14.0
config.front_end = "WebGpu"
config.tab_bar_at_bottom = true
config.enable_wayland = false

config.enable_kitty_keyboard = true
config.enable_csi_u_key_encoding = true

config.keys = {
	bind_super_key_to_vim("p"),
	bind_super_key_to_vim("P"),
	bind_super_key_to_vim("F"),
	{
		key = "t",
		mods = "CTRL",
		action = wezterm.action.DisableDefaultAssignment,
	},
}
-- and finally, return the configuration to wezterm
return config

-- Pull in the wezterm API
local wezterm = require("wezterm")
local config = wezterm.config_builder()

-- --- Window Configuration ---
config.window_decorations = "RESIZE" -- Only show resize handles
config.window_padding = {
	left = 12,
	right = 12,
	top = 24,
	bottom = 12,
}
config.window_background_opacity = 0.96 -- Slightly transparent background
config.hide_mouse_cursor_when_typing = true -- Auto-hide mouse cursor when typing

-- --- Theme Configuration ---
config.color_scheme = "Gruvbox Material (Gogh)" -- Set theme color scheme

-- --- Font Configuration ---
config.font = wezterm.font("Hack Nerd Font") -- Default font
config.font_rules = {
	{
		intensity = "Bold",
		font = wezterm.font("Hack Nerd Font", { weight = "Bold" }),
	},
	{
		italic = true,
		font = wezterm.font("Hack Nerd Font", { italic = true }),
	},
	{
		intensity = "Bold",
		italic = true,
		font = wezterm.font("Hack Nerd Font", { weight = "Bold", italic = true }),
	},
}
config.font_size = 12.5

-- --- Tab Bar Configuration ---
config.use_fancy_tab_bar = true -- Enable fancy tab bar
config.tab_bar_at_bottom = true -- Move the tab bar to the bottom
config.hide_tab_bar_if_only_one_tab = true -- Hide tab bar if there's only one tab

-- --- Initial Window Size ---
config.initial_cols = 150 -- Default number of columns
config.initial_rows = 50 -- Default number of rows

-- Return the configuration to WezTerm
return config

local wezterm = require("wezterm")
local config = wezterm.config_builder()

config.color_scheme = "nordfox"
config.font = wezterm.font("SauceCodePro Nerd Font")
config.font_size = 13.0

config.window_background_opacity = 0.95
config.macos_window_background_blur = 10

config.keys = {
	{
		key = "r",
		mods = "OPT|CMD",
		action = wezterm.action.PromptInputLine({
			description = "Rename tab:",
			action = wezterm.action_callback(function(window, pane, line)
				if line then
					window:active_tab():set_title(line)
				end
			end),
		}),
	},
	{
		key = ",",
		mods = "OPT|CMD",
		action = wezterm.action.MoveTabRelative(-1),
	},
	{
		key = ".",
		mods = "OPT|CMD",
		action = wezterm.action.MoveTabRelative(1),
	},
	{
		key = "\\",
		mods = "OPT|CMD",
		action = wezterm.action.SplitHorizontal({ domain = "CurrentPaneDomain" }),
	},
	{
		key = "-",
		mods = "OPT|CMD",
		action = wezterm.action.SplitVertical({ domain = "CurrentPaneDomain" }),
	},
	{ key = "LeftArrow", mods = "OPT|CMD", action = wezterm.action.AdjustPaneSize({ "Left", 3 }) },
	{ key = "RightArrow", mods = "OPT|CMD", action = wezterm.action.AdjustPaneSize({ "Right", 3 }) },
	{ key = "UpArrow", mods = "OPT|CMD", action = wezterm.action.AdjustPaneSize({ "Up", 3 }) },
	{ key = "DownArrow", mods = "OPT|CMD", action = wezterm.action.AdjustPaneSize({ "Down", 3 }) },
	{
		key = "h",
		mods = "CMD|OPT",
		action = wezterm.action.ActivatePaneDirection("Left"),
	},
	{
		key = "l",
		mods = "CMD|OPT",
		action = wezterm.action.ActivatePaneDirection("Right"),
	},
	{
		key = "k",
		mods = "CMD|OPT",
		action = wezterm.action.ActivatePaneDirection("Up"),
	},
	{
		key = "j",
		mods = "CMD|OPT",
		action = wezterm.action.ActivatePaneDirection("Down"),
	},
	{
		key = "w",
		mods = "OPT|CMD",
		action = wezterm.action.ShowLauncherArgs({ flags = "WORKSPACES" }),
	},
}

return config

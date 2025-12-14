local wezterm = require("wezterm")
local config = wezterm.config_builder()
local bar = wezterm.plugin.require("https://github.com/adriankarlen/bar.wezterm")

-- === APPEARANCE ===
-- config.color_scheme = "rose-pine"
config.color_scheme = "Catppuccin Mocha"
config.font = wezterm.font("JetBrains Mono Nerd Font")
config.font_size = 11.0

-- Minimal UI - removes title bar, keeps resize handles
config.window_decorations = "NONE"
-- config.hide_tab_bar_if_only_one_tab = true
config.window_background_opacity = 0.95
config.window_padding = {
	left = 10,
	right = 10,
	top = 10,
	bottom = 10,
}

-- === PERFORMANCE (macOS Apple Silicon) ===
config.front_end = "WebGpu"
config.max_fps = 120

-- === CURSOR ===
config.default_cursor_style = "BlinkingBar"
config.cursor_blink_rate = 500

-- === MULTIPLEXER (tmux-like keybindings) ===
config.leader = { key = "a", mods = "CTRL", timeout_milliseconds = 1000 }
config.keys = {
	-- Pane splitting
	{ mods = "LEADER", key = "-", action = wezterm.action.SplitVertical({ domain = "CurrentPaneDomain" }) },
	{ mods = "LEADER", key = "|", action = wezterm.action.SplitHorizontal({ domain = "CurrentPaneDomain" }) },

	-- Pane navigation (vim-style)
	{ mods = "LEADER", key = "h", action = wezterm.action.ActivatePaneDirection("Left") },
	{ mods = "LEADER", key = "j", action = wezterm.action.ActivatePaneDirection("Down") },
	{ mods = "LEADER", key = "k", action = wezterm.action.ActivatePaneDirection("Up") },
	{ mods = "LEADER", key = "l", action = wezterm.action.ActivatePaneDirection("Right") },

	-- Close pane
	{ mods = "LEADER", key = "x", action = wezterm.action.CloseCurrentPane({ confirm = true }) },

	-- Tab management
	{ mods = "LEADER", key = "c", action = wezterm.action.SpawnTab("CurrentPaneDomain") },
	{ mods = "LEADER", key = "n", action = wezterm.action.ActivateTabRelative(1) },
	{ mods = "LEADER", key = "p", action = wezterm.action.ActivateTabRelative(-1) },

	-- Quick tab switching (Leader + number)
	{ mods = "LEADER", key = "1", action = wezterm.action.ActivateTab(0) },
	{ mods = "LEADER", key = "2", action = wezterm.action.ActivateTab(1) },
	{ mods = "LEADER", key = "3", action = wezterm.action.ActivateTab(2) },
	{ mods = "LEADER", key = "4", action = wezterm.action.ActivateTab(3) },
	{ mods = "LEADER", key = "5", action = wezterm.action.ActivateTab(4) },

	-- Zoom pane (toggle fullscreen for current pane)
	{ mods = "LEADER", key = "z", action = wezterm.action.TogglePaneZoomState },

	-- Copy mode (like tmux)
	{ mods = "LEADER", key = "[", action = wezterm.action.ActivateCopyMode },
}

-- === DYNAMIC THEME (follows macOS appearance) ===
local function scheme_for_appearance(appearance)
	if appearance:find("Dark") then
		return "Catppuccin Mocha"
	else
		return "Catppuccin Latte"
	end
end

-- Uncomment to enable dynamic theme switching:
-- config.color_scheme = scheme_for_appearance(wezterm.gui.get_appearance())
bar.apply_to_config(config)
return config

-- The only required line is this one.
local wezterm = require("wezterm")
local mux = wezterm.mux
local act = wezterm.action
-- Some empty tables for later use
local config = {}
local keys = {}
local mouse_bindings = {}
local launch_menu = {}

--- Key bindings
config.leader = { key = "a", mods = "CTRL", timeout_milliseconds = 1000 }

table.insert(keys, {
	key = "c",
	mods = "LEADER|CTRL",
	action = act.SpawnTab("CurrentPaneDomain"),
})

table.insert(keys, {
	key = "c",
	mods = "LEADER",
	action = wezterm.action.CloseCurrentPane({ confirm = false }),
})

table.insert(keys, {
	key = "v",
	mods = "LEADER",
	action = wezterm.action.SplitHorizontal({ domain = "CurrentPaneDomain" }),
})

table.insert(keys, {
	key = "s",
	mods = "LEADER",
	action = wezterm.action.SplitVertical({ domain = "CurrentPaneDomain" }),
})

table.insert(keys, {
	key = "z",
	mods = "LEADER",
	action = wezterm.action.TogglePaneZoomState,
})

table.insert(keys, {
	key = "p",
	mods = "LEADER",
	action = act.PaneSelect({
		alphabet = "1234567890",
	}),
})

for i = 1, 8 do
  -- CTRL+ALT + number to activate that tab
  table.insert(keys, {
    key = tostring(i),
    mods = 'LEADER',
    action = act.ActivateTab(i - 1),
  })
end

---

if wezterm.target_triple == 'x86_64-pc-windows-msvc' then
  config.default_prog = { "C:/Program Files/Git/bin/bash.exe" }
end

--- Default config settings
config.color_scheme = "Catppuccin Mocha"
config.font = wezterm.font("JetBrainsMono Nerd Font")
config.font_size = 10
config.launch_menu = launch_menu
config.default_cursor_style = "BlinkingBar"
config.disable_default_key_bindings = true
config.keys = keys
config.mouse_bindings = mouse_bindings

config.window_background_opacity = 0.9

local tabline = wezterm.plugin.require("https://github.com/michaelbrusegard/tabline.wez")
tabline.setup()
tabline.apply_to_config(config)

return config

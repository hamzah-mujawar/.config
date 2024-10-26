local wezterm = require 'wezterm'
local act = wezterm.action
local config = {}

if wezterm.config_builder then
    config = wezterm.config_builder()
end


config.use_fancy_tab_bar = false

config.color_scheme = "Tokyo Night"
config.font = wezterm.font_with_fallback({
  { family = "CaskaydiaCove Nerd Font",       scale = 1.2, weight = "Medium", },
  { family = "FantasqueSansM Nerd Font", scale = 1.3, },
})
config.window_background_opacity = 0.9
config.scrollback_lines = 3000

config.inactive_pane_hsb = {
  saturation = 0.24,
  brightness = 0.5
}

config.window_frame = {
    font = wezterm.font { family = 'FiraCode Nerd Font Mono', weight = 'Bold' },
    font_size = 10.0,
}
config.keys = {
    -- Pane keybindings
    { key = "s",          mods = "CTRL",      action = act.SplitVertical { domain = "CurrentPaneDomain" } },
    { key = "v",          mods = "CTRL",      action = act.SplitHorizontal { domain = "CurrentPaneDomain" } },
    { key = "h",          mods = "CTRL",      action = act.ActivatePaneDirection("Left") },
    { key = "j",          mods = "CTRL",      action = act.ActivatePaneDirection("Down") },
    { key = "k",          mods = "CTRL",      action = act.ActivatePaneDirection("Up") },
    { key = "l",          mods = "CTRL",      action = act.ActivatePaneDirection("Right") },
    { key = "w",          mods = "CTRL",      action = act.CloseCurrentPane{ confirm = true }},
}
return config

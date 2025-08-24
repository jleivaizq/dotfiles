local wezterm = require("wezterm")
local mux = wezterm.mux
local config = wezterm.config_builder()

-- Use HOME for robust paths
local HOME = os.getenv("HOME") or "~"

-- Maximize the first window on GUI startup (fill screen, not "true" fullscreen)
wezterm.on("gui-startup", function(cmd)
	local tab, pane, window = mux.spawn_window(cmd or {})
	window:gui_window():maximize()
end)

-- Core behavior & look
config.automatically_reload_config = true
config.enable_tab_bar = false
config.window_close_confirmation = "NeverPrompt"
config.window_decorations = "RESIZE" -- resizable border, no title bar
config.term = "xterm-256color" -- keeps Backspace / Ctrl+L working
config.color_scheme = "Catppuccin Mocha"

-- Font
config.font = wezterm.font_with_fallback({
	"Hack Nerd Font",
	"SF Mono",
	"Menlo",
})
config.font_size = 15
config.harfbuzz_features = { "calt=1", "clig=1", "liga=1" }

-- Padding
config.window_padding = { left = 10, right = 10, top = 10, bottom = 10 }

-- Background: your image + subtle overlay
config.background = {
	{
		source = { File = HOME .. "/.config/wezterm/bg-monterrey.jpg" },
		hsb = { hue = 1.0, saturation = 1.02, brightness = 0.25 },
	},
	{
		source = { Color = "#282c35" },
		width = "100%",
		height = "100%",
		opacity = 0.25,
	},
}

return config

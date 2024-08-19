local wezterm = require("wezterm")

config = wezterm.config_builder()

config = {
    automatically_reload_config = true,
    enable_tab_bar = false,
    window_close_confirmation = "NeverPrompt",
    window_decorations = "RESIZE", -- disable the title bar but enable the resizable border
    color_scheme = "catppuccin-mocha",
    font = wezterm.font("Hack Nerd Font", { weight = "Regular" }),
    font_size = 15,
    window_padding = {
        left = 10,
        right = 10,
        top = 10,
        bottom = 10,
    },
    background = {
        {
      source = {
        File = "/Users/" .. os.getenv("USER") .. "/.config/wezterm/bg-monterrey.jpg",
      },
      hsb = {
        hue = 1.0,
        saturation = 1.02,
        brightness = 0.25,
      },
      -- attachment = { Parallax = 0.3 },
      -- width = "100%",
      -- height = "100%",
    },
    {
      source = {
        Color = "#282c35",
      },
      width = "100%",
      height = "100%",
      opacity = 0.25,
    },
  },
}

return config

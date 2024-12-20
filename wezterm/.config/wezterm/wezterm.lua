local wezterm = require("wezterm")
local colors = require("chill_mentor")

local config = wezterm.config_builder()

config = {
    automatically_reload_config = true,
    enable_tab_bar = false,
    -- window_close_confirmation = "NeverPrompt",
    font = wezterm.font("Iosevka Term"),
    font_size = 14,
    harfbuzz_features = { 'calt=0', 'clig=0', 'liga=0' },
    adjust_window_size_when_changing_font_size = true,
    window_decorations = "INTEGRATED_BUTTONS|RESIZE|MACOS_FORCE_ENABLE_SHADOW",
    initial_rows = 48,
    initial_cols = 120,
    colors = colors,
    default_cursor_style = "SteadyBlock",
    cursor_blink_ease_in = "Constant",
    cursor_blink_ease_out = "Constant",
    window_padding = {
        top = "1.5cell",
    },
}

return config

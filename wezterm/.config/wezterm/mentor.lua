-- colors.lua
return {
    -- The default text color
    foreground = "#bcbcbc",
    -- The default background color
    background = "#1c1c1c",
    -- Cursor colors
    cursor_bg = "#6c6c6c",
    cursor_fg = "#bcbcbc",  -- cursor text color
    cursor_border = "#87af87",
    -- Selection colors
    selection_fg = "#bcbcbc",
    selection_bg = "#303030",
    -- The 16 terminal colors (first 8 are "normal" colors, last 8 are "bright" colors)
    ansi = {
        "#262626", -- black
        "#af5f5f", -- red
        "#5f875f", -- green
        "#87875f", -- yellow
        "#5f87af", -- blue
        "#5f5f87", -- magenta
        "#5f8787", -- cyan
        "#bcbcbc", -- white
    },
    brights = {
        "#444444", -- bright black
        "#ff8700", -- bright red
        "#87af87", -- bright green
        "#ffffaf", -- bright yellow
        "#8fafd7", -- bright blue
        "#8787af", -- bright magenta
        "#5fafaf", -- bright cyan
        "#eeeeee", -- bright white
    },
}

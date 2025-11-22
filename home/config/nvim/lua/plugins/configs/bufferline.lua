local status_ok, bl = pcall(require, "bufferline")
if not status_ok then
    return
end

local t = require("catppuccin.palettes").get_palette("macchiato")
bl.setup({
    highlights = require("catppuccin.special.bufferline").get_theme({
        styles = { "bold" },
        custom = {
            macchiato = {
                fill = { bg = t.mantle },
                background = { bg = t.base },
                separator = { fg = t.mantle, bg = t.base },
                separator_selected = { fg = t.mantle, bg = t.surface1 },
                separator_visible = { fg = t.mantle, bg = t.surface0 },
                buffer_selected = { bg = t.surface1 },
                buffer_visible = { bg = t.surface0, fg = t.subtext1 },
                close_button = { bg = t.base },
                close_button_selected = { bg = t.surface1 },
                close_button_visible = { bg = t.surface0 },
                modified = { bg = t.base },
                modified_selected = { bg = t.surface1 },
                modified_visible = { bg = t.surface0 },
                duplicate_selected = { bg = t.surface1 },
                duplicate_visible = { bg = t.surface0 },
                duplicate = { bg = t.base },
                trunc_marker = { bg = t.mantle },
            },
        },
    }),
    options = {
        close_command = "bdelete! %d", -- can be a string | function, see "Mouse actions"
        right_mouse_command = "bdelete! %d", -- can be a string | function, see "Mouse actions"
        -- separator_style = { "|", "|" }, -- slant, padded_slant; slope, padded_slope; thick; thin
        separator_style = "slope",
        color_icons = true,
        always_show_bufferline = true,
        themable = true,
        show_buffer_icons = true,
        hover = {
            enabled = false,
            delay = 200,
            reveal = { "close" },
        },
    },
})

-- Open Alpha for No name buffers

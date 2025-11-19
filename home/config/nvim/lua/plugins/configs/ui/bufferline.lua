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
                fill = { bg = t.crust },
                background = { bg = t.base },
                separator = { fg = t.crust, bg = t.base },
                separator_selected = { fg = t.crust, bg = t.surface1 },
                separator_visible = { fg = t.crust, bg = t.surface0 },
                buffer_selected = { bg = t.surface1 },
                buffer_visible = { bg = t.surface0, fg = t.subtext1 },
                close_button = { bg = t.base },
                close_button_selected = { bg = t.surface1 },
                close_button_visible = { bg = t.surface0 },
                modified = { bg = t.base },
                modified_selected = { bg = t.surface1 },
                modified_visible = { bg = t.surface0 },
            },
        },
    }),
    options = {
        close_command = "bdelete! %d", -- can be a string | function, see "Mouse actions"
        right_mouse_command = "bdelete! %d", -- can be a string | function, see "Mouse actions"
        offsets = { { filetype = "NeoTree", text = "", padding = 1 } },
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

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
                -- fill = { bg = t.mantle },
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
                indicator_selected = { bg = t.surface1, fg = t.surface1 },
                indicator_visible = { bg = t.surface1, fg = t.surface1 },
                duplicate = { bg = t.base, bold = false },
                trunc_marker = { bg = t.mantle },

                -- Diagnostic highlights
                error = { bg = t.base },
                error_visible = { bg = t.surface0 },
                error_selected = { bg = t.surface1 },
                warning = { bg = t.base },
                warning_visible = { bg = t.surface1 },
                warning_selected = { bg = t.surface1 },
                info = { bg = t.base },
                info_visible = { bg = t.surface0 },
                info_selected = { bg = t.surface1 },
                hint = { bg = t.base },
                hint_visible = { bg = t.surface0 },
                hint_selected = { bg = t.surface1 },
                diagnostic = { bg = t.base },
                diagnostic_visible = { bg = t.surface0 },
                diagnostic_selected = { bg = t.surface1 },
                error_diagnostic = { bg = t.base },
                error_diagnostic_visible = { bg = t.surface0 },
                error_diagnostic_selected = { bg = t.surface1 },
                warning_diagnostic = { bg = t.base },
                warning_diagnostic_visible = { bg = t.surface0 },
                warning_diagnostic_selected = { bg = t.surface1 },
                info_diagnostic = { bg = t.base },
                info_diagnostic_visible = { bg = t.surface0 },
                info_diagnostic_selected = { bg = t.surface1 },
                hint_diagnostic = { bg = t.base },
                hint_diagnostic_visible = { bg = t.surface0 },
                hint_diagnostic_selected = { bg = t.surface1 },
                -- Tab highlights
                tab = { bg = t.base, fg = t.overlay1 },
                tab_selected = { bg = t.surface1, fg = t.blue },
                tab_separator = { fg = t.mantle, bg = t.base },
                tab_separator_selected = { fg = t.mantle, bg = t.surface1 },
                tab_close = { bg = t.base, fg = t.overlay1 },
            },
        },
    }),
    options = {
        close_command = "bdelete! %d", -- can be a string | function, see "Mouse actions"
        right_mouse_command = "bdelete! %d", -- can be a string | function, see "Mouse actions"
        -- separator_style = { "▓","▓" }, -- slant, padded_slant; slope, padded_slope; thick; thin
        separator_style = "thick",
        color_icons = true,
        always_show_bufferline = true,
        themable = true,
        show_buffer_icons = true,
        diagnostics = "nvim_lsp",
        hover = {
            enabled = false,
            delay = 200,
            reveal = { "close" },
        },
        offsets = {
            {
                filetype = "",
                text = "",
                padding = 6,
                separator = false,
            },
        },
    },
})

-- Open Alpha for No name buffers

local status_ok, bl = pcall(require, "bufferline")
if not status_ok then
    return
end

bl.setup({
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

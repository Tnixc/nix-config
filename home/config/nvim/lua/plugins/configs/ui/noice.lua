require("noice").setup({
    lsp = {
        progress = {
            enabled = false,
        },
        hover = {
            opts = {
                border = {
                    style = "single",
                    highlight = "MantleBorder",
                },
                position = {
                    row = 2,
                },
            },
        },
    },
    messages = {
        -- NOTE: If you enable messages, then the cmdline is enabled automatically.
        -- This is a current Neovim limitation.
        enabled = true, -- enables the Noice messages UI
        view = "notify", -- default view for messages
        view_error = "notify", -- view for errors
        view_warn = "notify", -- view for warnings
        view_history = "messages", -- view for :messages
        view_search = "virtualtext", -- view for search count messages. Set to `false` to disable
    },
    routes = {
        {
            view = "notify",
            filter = { event = "msg_showmode" },
        },
    },
    presets = { inc_rename = true },
    cmdline = {
        view = "cmdline",
        format = {
            cmdline = { pattern = "^:", icon = "󰘳 ", lang = "vim" },
            search_down = { kind = "search", pattern = "^/", icon = "󰩊 ", lang = "regex" },
            search_up = { kind = "search", pattern = "^%?", icon = "󰩊 ", lang = "regex" },
            filter = { pattern = "^:%s*!", icon = "󰻿 ", lang = "bash" },
            lua = { pattern = { "^:%s*lua%s+", "^:%s*lua%s*=%s*", "^:%s*=%s*" }, icon = "", lang = "lua" },
            help = { pattern = "^:%s*he?l?p?%s+", icon = "󰞋 " },
        },
    },
})

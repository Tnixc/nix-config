-- Editor enhancement plugins

return {
    -- Log file highlighting
    {
        "fei6409/log-highlight.nvim",
        event = "VeryLazy",
        config = function()
            require("log-highlight").setup({})
        end,
    },

    -- Auto-save
    {
        "pocco81/auto-save.nvim",
        event = "VeryLazy",
        opts = {
            execution_message = { message = "" },
        },
    },

    -- Search and replace
    {
        "MagicDuck/grug-far.nvim",
        cmd = "GrugFar",
        config = function()
            require("grug-far").setup({})
        end,
    },

    -- Multiple cursors
    {
        "jake-stewart/multicursor.nvim",
        branch = "1.0",
        config = function()
            local mc = require("multicursor-nvim")
            mc.setup()
        end,
    },

    -- Mini.nvim collection
    {
        version = "*",
        event = "VeryLazy",
        "nvim-mini/mini.nvim",
        config = function()
            require("mini.surround").setup({
                mappings = {
                    add = "s",
                },
            })
            require("mini.diff").setup({
                view = {
                    style = "sign",
                    signs = { add = "│", change = "│", delete = "─" },
                    priority = 199,
                },
            })
            require("mini.move").setup({
                mappings = {
                    left = "",
                    right = "",
                    up = "<M-k>",
                    down = "<M-j>",
                    line_left = "",
                    line_right = "",
                    line_down = "<M-j>",
                    line_up = "<M-k>",
                },
            })
            require("mini.comment").setup({
                mappings = {
                    comment = "",
                    comment_line = "<D-/>",
                    comment_visual = "<D-/>",
                    textobject = "<D-/>",
                },
            })
            require("mini.pairs").setup({ view = { style = "sign" } })
        end,
    },

    -- Auto-close HTML tags
    {
        "alvan/vim-closetag",
        event = "InsertEnter",
        config = function()
            vim.g.closetag_filenames = "*.vue,*.svelte,*.html,*.xhtml,*.phtml"
            vim.g.closetag_xhtml_filenames = "*.xhtml,*.jsx,*.tsx"
        end,
    },
    {
        "windwp/nvim-ts-autotag",
        event = "InsertEnter",
        opts = {},
    },

    -- Session management
    {
        "rmagatti/auto-session",
        lazy = false,
        opts = {
            bypass_save_filetypes = { "snacks_dashboard", "" },
            post_restore_cmds = {
                function()
                    -- Show dashboard if restored to a blank buffer
                    vim.schedule(function()
                        local buf = vim.api.nvim_get_current_buf()
                        local bufname = vim.api.nvim_buf_get_name(buf)
                        local bufft = vim.bo[buf].filetype
                        if bufname == "" and bufft == "" then
                            Snacks.dashboard()
                        end
                    end)
                end,
            },
        },
    },

    -- Copilot
    {
        "zbirenbaum/copilot.lua",
        cmd = "Copilot",
        event = "InsertEnter",
        opts = {
            suggestion = { enabled = false },
            panel = { enabled = false },
            filetypes = {
                markdown = true,
                help = true,
            },
        },
    },
    {
        "folke/flash.nvim",
        event = "VeryLazy",
        opts = {
            modes = {
                char = {
                    enabled = false, -- disable default f/F/t/T
                },
            },
        },
    },
}

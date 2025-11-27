-- UI-related plugins

return {
    -- Colorschemes
    {
        "catppuccin/nvim",
        name = "catppuccin",
        priority = 1000,
        config = function()
            require("plugins.configs.colorscheme")
        end,
    },
    { "sam4llis/nvim-tundra", opts = {}, lazy = true },
    { "Everblush/nvim", name = "everblush", opts = {}, lazy = true },
    { "projekt0n/github-nvim-theme", name = "github-theme", opts = {}, lazy = true },
    { "tiagovla/tokyodark.nvim", opts = {}, lazy = true },
    { "rose-pine/neovim", name = "rose-pine", opts = {}, lazy = true },

    -- Icons
    {
        "rachartier/tiny-devicons-auto-colors.nvim",
        dependencies = { "nvim-tree/nvim-web-devicons" },
        event = "VeryLazy",
        config = function()
            require("tiny-devicons-auto-colors").setup({})
        end,
    },

    -- Dim inactive windows
    {
        "tadaa/vimade",
        opts = {
            recipe = { "default", { animate = false } },
            fadelevel = 0.2,
            checkinterval = 0,
            basebg = "#121212",
            blocklist = {
                default_block = function(win, current)
                    -- current can be nil
                    if (win.win_config.relative == "") and (current and current.win_config.relative ~= "") then
                        return false
                    end
                    return true
                end,
            },
            link = {
                snacks_explorer = function(win, current)
                    if not current then
                        return false
                    end
                    -- Link explorer with other windows so main doesn't fade
                    local dominated_fts = { "snacks_picker_list", "snacks_picker_preview" }
                    return vim.tbl_contains(dominated_fts, win.buf_opts.filetype)
                        or vim.tbl_contains(dominated_fts, current.buf_opts.filetype)
                end,
            },
        },
    },

    -- Buffer tabs
    {
        "akinsho/bufferline.nvim",
        event = "BufAdd",
        dependencies = {
            "nvim-tree/nvim-web-devicons",
            "rachartier/tiny-devicons-auto-colors.nvim",
            { "tiagovla/scope.nvim", config = true },
        },
        config = function()
            require("plugins.configs.bufferline")
        end,
    },

    -- Status line
    {
        "nvim-lualine/lualine.nvim",
        event = "UIEnter",
        dependencies = { "nvim-tree/nvim-web-devicons", "AndreM222/copilot-lualine" },
        config = function()
            require("plugins.configs.lualine")
        end,
    },

    -- Diagnostics
    {
        "folke/trouble.nvim",
        cmd = "Trouble",
        opts = { auto_preview = true },
    },
    {
        "rachartier/tiny-inline-diagnostic.nvim",
        event = "BufReadPost",
        priority = 1000,
        config = function()
            require("tiny-inline-diagnostic").setup({
                preset = "classic",
                options = {
                    use_icons_from_diagnostic = true,
                    multiple_diag_under_cursor = true,
                    show_all_diags_on_cursorline = true,
                    enable_on_insert = true,
                    multilines = {
                        enabled = true,
                        always_show = true,
                    },
                    format = function(diag)
                        return "⠀" .. diag.message .. " — " .. diag.source
                    end,
                },
            })
            vim.diagnostic.config({ virtual_text = false })
        end,
    },

    -- Git diff view
    {
        "sindrets/diffview.nvim",
        cmd = { "DiffviewOpen", "DiffviewFileHistory" },
        config = function()
            require("diffview").setup({
                file_panel = {
                    listing_style = "tree",
                    win_config = {
                        position = "right",
                        width = 30,
                        win_opts = {},
                    },
                },
            })
        end,
    },

    -- Rainbow delimiters
    { "hiphish/rainbow-delimiters.nvim", event = "BufReadPost" },

    -- Modern UI components
    {
        "folke/noice.nvim",
        event = "VeryLazy",
        dependencies = { "MunifTanjim/nui.nvim" },
        config = function()
            require("plugins.configs.noice")
        end,
    },
    {
        "stevearc/dressing.nvim",
        event = "VeryLazy",
        opts = {
            input = {
                enabled = true,
                default_prompt = "> ",
                win_options = {
                    winblend = 0,
                },
            },
            select = {
                enabled = true,
                backend = { "builtin" },
                builtin = {
                    border = "single",
                    relative = "cursor",
                    win_options = {
                        winblend = 0,
                    },
                },
            },
        },
    },
}

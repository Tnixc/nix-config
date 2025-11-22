local ok, lazy = pcall(require, "lazy")
if not ok then
    return
end

function Border(hl_name)
    return {
        { "┌", hl_name },
        { "─", hl_name },
        { "┐", hl_name },
        { "│", hl_name },
        { "┘", hl_name },
        { "─", hl_name },
        { "└", hl_name },
        { "│", hl_name },
    }
end

lazy.setup({
    root = vim.fn.stdpath("data") .. "/lazy",
    -- Appearance
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
    {
        "rachartier/tiny-devicons-auto-colors.nvim",
        dependencies = { "nvim-tree/nvim-web-devicons" },
        event = "VeryLazy",
        config = function()
            require("tiny-devicons-auto-colors").setup({})
        end,
    },

    -- UI Enhancements
    {
        "akinsho/bufferline.nvim",
        event = "BufAdd",
        dependencies = { "nvim-tree/nvim-web-devicons", "rachartier/tiny-devicons-auto-colors.nvim" },
        config = function()
            require("plugins.configs.bufferline")
        end,
    },
    {
        "nvim-lualine/lualine.nvim",
        event = "UIEnter",
        dependencies = { "nvim-tree/nvim-web-devicons" },
        config = function()
            require("plugins.configs.lualine")
        end,
    },
    {
        "folke/todo-comments.nvim",
        event = "BufReadPost",
        opts = {},
    },
    {
        "folke/trouble.nvim",
        cmd = "Trouble",
        opts = {},
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
                },
            })
            vim.diagnostic.config({ virtual_text = false }) -- Only if needed in your configuration, if you already have native LSP diagnostics
        end,
    },
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
    { "hiphish/rainbow-delimiters.nvim", event = "BufReadPost" },
    {
        "folke/noice.nvim",
        event = "VeryLazy",
        opts = {},
        dependencies = { "MunifTanjim/nui.nvim" },
        config = function()
            require("plugins.configs.noice")
        end,
    },
    {
        "petertriho/nvim-scrollbar",
        event = "BufReadPost",
        opts = { handlers = { gitsigns = true } },
    },

    -- Utility
    {
        "fei6409/log-highlight.nvim",
        event = "VeryLazy",
        config = function()
            require("log-highlight").setup({})
        end,
    },
    {
        "nullishamy/autosave.nvim",
        event = "VeryLazy",
        config = function()
            require("autosave").setup({})
        end,
    },
    {
        "willothy/moveline.nvim",
        event = "VeryLazy",
        build = "make",
    },

    -- Editing Helpers
    {
        "MagicDuck/grug-far.nvim",
        cmd = "GrugFar",
        config = function()
            require("grug-far").setup({})
        end,
    },
    {
        "jake-stewart/multicursor.nvim",
        branch = "1.0",
        config = function()
            local mc = require("multicursor-nvim")
            mc.setup()
        end,
    },
    {
        "kylechui/nvim-surround",
        version = "*",
        event = "VeryLazy",
        config = function()
            require("nvim-surround").setup({ keymaps = { visual = "s" } }) -- NOTE: Keymaps here
        end,
    },
    {
        "numToStr/Comment.nvim",
        event = "VeryLazy",
        config = function()
            require("Comment").setup({
                toggler = { line = "<D-/>" },
                opleader = { line = "<D-/>" },
                mappings = { extra = false, basic = true },
            })
        end,
    },
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

    -- Navigation and Search
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
    {
        "folke/snacks.nvim",
        priority = 1000,
        lazy = false,
        config = function()
            require("plugins.configs.snacks")
        end,
    },

    -- Git Integration
    {
        "lewis6991/gitsigns.nvim",
        opts = { current_line_blame = true },
        event = "BufReadPost",
    },

    -- Miscellaneous
    {
        "rachartier/tiny-glimmer.nvim",
        event = "TextYankPost",
        opts = {},
    },
    {
        "vyfor/cord.nvim",
        build = "./build || .\\build",
        event = "VeryLazy",
        opts = {},
    }, -- discord presence
    {
        "catgoose/nvim-colorizer.lua",
        event = "BufReadPre",
        opts = {
            filetypes = { "*" },
            user_default_options = {
                css = true,
                names = false,
                tailwind = true,
                mode = "virtualtext",
                virtualtext_inline = "before",
                virtualtext = "􀑌",
            },
        },
    },
    {
        "nacro90/numb.nvim",
        opts = {},
        event = "VeryLazy",
    },
    {
        "MeanderingProgrammer/render-markdown.nvim",
        event = "VeryLazy",
        opts = {
            heading = {
                width = "block",
                left_pad = 1,
                right_pad = 2,
                position = "inline",
            },
            code = {
                width = "block",
                left_pad = 2,
                right_pad = 2,
            },
        },
        dependencies = { "nvim-treesitter/nvim-treesitter", "nvim-tree/nvim-web-devicons" },
    },
    { "christoomey/vim-tmux-navigator", event = "VeryLazy" },

    -- Syntax and Language Support
    {
        "xiyaowong/virtcolumn.nvim",
        event = "VeryLazy",
    },
    {
        "nvim-treesitter/nvim-treesitter",
        event = "BufReadPost",
        config = function()
            require("plugins.configs.treesitter")
        end,
    },
    {
        "folke/which-key.nvim",
        event = "VeryLazy",
        opts = {
            delay = 1000,
            preset = "modern",
            win = {
                border = "single",
                title = true,
            },
        },
        config = function(_, opts)
            local wk = require("which-key")
            wk.setup(opts)
            vim.api.nvim_set_hl(0, "WhichKeyBorder", { link = "MantleBorder" })
        end,
    },

    -- LSP and Completion
    {
        "williamboman/mason.nvim",
        build = ":MasonUpdate",
        config = function()
            require("mason").setup({
                ui = {
                    border = "rounded",
                    icons = {
                        package_installed = "✓",
                        package_pending = "➜",
                        package_uninstalled = "✗",
                    },
                },
            })
            -- Load LSP configuration
            require("plugins.configs.lsp")
        end,
    },
    {
        "stevearc/conform.nvim",
        event = { "BufWritePre" },
        cmd = { "ConformInfo" },
        opts = {
            formatters_by_ft = {
                lua = { "stylua" },
                nix = { "nixfmt" },
                racket = { "raco_fmt" },
                go = { "goimports", "gofmt" },
                typescriptreact = { "prettierd" },
                javascriptreact = { "prettierd" },
                javascript = { "prettierd" },
                typescript = { "prettierd" },
                svelte = { "prettierd" },
                astro = { "prettierd" },
                vue = { "prettierd" },
                markdown = { "prettierd" },
                json = { "prettierd" },
                yaml = { "prettierd" },
                html = { "prettierd" },
                css = { "prettierd" },
                scss = { "prettierd" },
            },
            formatters = {
                raco_fmt = {
                    command = "raco",
                    args = { "fmt", "-i", "$FILENAME" },
                    stdin = false,
                },
            },
        },
    },
    {
        "kawre/leetcode.nvim",
        cmd = "Leet",
        dependencies = {
            "nvim-lua/plenary.nvim",
            "MunifTanjim/nui.nvim",
        },
        opts = {
            lang = "typescript",
            image_support = true,
        },
    },
    {
        "saghen/blink.cmp",
        version = "*",
        build = "nix run .#build-plugin",
        event = "InsertEnter",
        dependencies = { "rafamadriz/friendly-snippets" },
        opts = {
            keymap = {
                preset = "default",
                ["<Tab>"] = { "accept", "fallback" },
                ["<C-j>"] = { "select_next", "fallback" },
                ["<C-k>"] = { "select_prev", "fallback" },
            },
            appearance = {
                nerd_font_variant = "normal",
            },
            completion = {
                menu = {
                    draw = {
                        columns = { { "kind_icon" }, { "label", "label_description", gap = 1 } },
                        treesitter = { "lsp" },
                    },
                    winhighlight = "Normal:CmpNormal,FloatBorder:CmpNormal,CursorLine:CmpSel,Search:None",
                },
                documentation = {
                    auto_show = true,
                    auto_show_delay_ms = 0,
                    window = {
                        border = "single",
                        winhighlight = "Normal:DocNormal,FloatBorder:CrustBorder",
                    },
                },
            },
            sources = {
                default = { "lsp", "path", "snippets", "buffer" },
            },
        },
    },
    { "artemave/workspace-diagnostics.nvim", event = "VeryLazy" },
    { "kevinhwang91/nvim-ufo", dependencies = { "kevinhwang91/promise-async" }, event = "VeryLazy" },
    -- LSP configuration (using Neovim 0.11 native API with Mason-installed servers)
    {
        "linrongbin16/lsp-progress.nvim",
        config = function()
            require("lsp-progress").setup({
                format = function(client_messages)
                    if #client_messages > 0 then
                        return table.concat(client_messages, " ")
                    end
                    return ""
                end,
            })
        end,
    },
})

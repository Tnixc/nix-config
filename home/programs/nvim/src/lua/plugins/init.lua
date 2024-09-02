local ok, lazy = pcall(require, "lazy")
if not ok then
    return
end
lazy.setup({
    root = vim.fn.stdpath("data") .. "/lazy",

    -- Appearance
    {
        "catppuccin/nvim",
        name = "catppuccin",
        priority = 1000,
        config = function()
            require("plugins.configs.ui.colorscheme")
        end,
    },
    {
        "goolord/alpha-nvim",
        config = function()
            require("plugins.configs.ui.alpha")
        end,
    },
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
        dependencies = { "kyazdani42/nvim-web-devicons" },
        config = function()
            require("plugins.configs.ui.bufferline")
        end,
    },
    { "famiu/bufdelete.nvim" },
    {
        "nvim-lualine/lualine.nvim",
        dependencies = { "kyazdani42/nvim-web-devicons" },
        config = function()
            require("plugins.configs.ui.lualine")
        end,
    },
    {
        "nvim-tree/nvim-tree.lua",
        event = "VeryLazy",
        config = function()
            require("plugins.configs.ui.nvim-tree")
        end,
    },
    {
        "folke/todo-comments.nvim",
        event = "VeryLazy",
        opts = {}
    },
    {
        "folke/trouble.nvim",
        event = "VeryLazy",
        opts = {},
        cmd = "Trouble"
    },
    {
        "sindrets/diffview.nvim",
        event = "VeryLazy",
        config = function()
            require(
                "diffview").setup({})
        end
    },
    { "HiPhish/rainbow-delimiters.nvim" },
    {
        "folke/noice.nvim",
        event = "VeryLazy",
        opts = {},
        dependencies = { "MunifTanjim/nui.nvim" },
        config = function()
            require("plugins.configs.ui.noice")
        end,
    },
    {
        "petertriho/nvim-scrollbar",
        config = function()
            require("plugins.configs.ui.scrollbar")
        end,
    },

    -- Utility
    {
        "nullishamy/autosave.nvim",
        event = "VeryLazy",
        config = function() require("autosave").setup({}) end
    },
    {
        "willothy/moveline.nvim",
        build = 'make'
    },

    -- Editing Helpers
    {
        "kylechui/nvim-surround",
        version = "*",
        event = "VeryLazy",
        config = function()
            require("nvim-surround").setup({ keymaps = { visual = "s" } })
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
        end
    },
    {
        "alvan/vim-closetag",
        event = "VeryLazy",
        config = function()
            vim.g.closetag_filenames = "*.vue,*.svelte,*.html,*.xhtml,*.phtml"
            vim.g.closetag_xhtml_filenames = "*.xhtml,*.jsx"
        end,
    },
    {
        "windwp/nvim-autopairs",
        config = true,
        event = "InsertEnter"
    },
    {
        "windwp/nvim-ts-autotag",
        event = "VeryLazy",
        opts = {}
    },

    -- Navigation and Search
    {
        "akinsho/toggleterm.nvim",
        version = "*",
        opts = { open_mapping = [[<M-l>]] }
    },
    {
        "natecraddock/workspaces.nvim",
        config = function()
            require("workspaces").setup({ hooks = { open = { "Telescope find_files" } } })
        end
    },
    {
        "nvim-telescope/telescope.nvim",
        dependencies = {
            "nvim-lua/plenary.nvim",
            "nvim-telescope/telescope-ui-select.nvim",
        },
        config = function()
            require("plugins.configs.telescope")
        end,
    },
    {
        "nvim-telescope/telescope-file-browser.nvim",
        dependencies = { "nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim" },
    },

    -- Git Integration
    {
        "lewis6991/gitsigns.nvim",
        config = true,
        event = "BufEnter"
    },
    { "kdheepak/lazygit.nvim" },

    -- Miscellaneous
    {
        "smoka7/multicursors.nvim",
        event = "VeryLazy",
        dependencies = { "nvimtools/hydra.nvim" },
        opts = {},
    },
    {
        "karb94/neoscroll.nvim",
        event = "BufEnter",
        config = function()
            require("neoscroll").setup({})
        end,
    },
    {
        "norcalli/nvim-colorizer.lua",
        event = "VeryLazy",
        config = function()
            require("colorizer").setup({})
        end,
    },
    {
        "MeanderingProgrammer/render-markdown.nvim",
        event = "VeryLazy",
        opts = {
            heading = {
                width = 'block',
                left_pad = 1,
                right_pad = 2,
                position = 'inline',
            },
            code = {
                width = 'block',
                left_pad = 2,
                right_pad = 2,
            }
        },
        dependencies = { "nvim-treesitter/nvim-treesitter", "nvim-tree/nvim-web-devicons" },
    },
    {
        "anuvyklack/windows.nvim",
        event = "VeryLazy",
        dependencies = { "anuvyklack/middleclass", "anuvyklack/animation.nvim" },
        config = function()
            vim.o.winwidth = 10
            vim.o.winminwidth = 10
            vim.o.equalalways = false
            require("windows").setup({})
        end,
    },
    { "christoomey/vim-tmux-navigator" },

    -- Syntax and Language Support
    {
        "nvim-treesitter/nvim-treesitter",
        config = function()
            require("plugins.configs.treesitter")
        end,
    },
    {
        "folke/which-key.nvim",
        event = "VeryLazy",
        opts = { delay = 1000, preset = "modern" },
    },

    -- LSP and Completion
    {
        "supermaven-inc/supermaven-nvim",
        event = "VeryLazy",
        config = function()
            require("supermaven-nvim").setup({
                log_level = "off",
                keymaps = {
                    accept_suggestion = "<M-n>",
                    clear_suggestion = "<C-]>",
                    accept_word = "<C-j>",
                },
            })
        end,
    },
    {
        "hrsh7th/nvim-cmp",
        event = "InsertEnter",
        dependencies = {
            {
                "L3MON4D3/LuaSnip",
                build = (function()
                    if vim.fn.has("win32") == 1 or vim.fn.executable("make") == 0 then
                        return
                    end
                    return "make install_jsregexp"
                end)(),
            },
            "saadparwaiz1/cmp_luasnip",
            "hrsh7th/cmp-nvim-lsp",
            "hrsh7th/cmp-path",
            "onsails/lspkind.nvim",
        },
        config = function()
            require("plugins.configs.cmp")
        end,
    },
    {
        "neovim/nvim-lspconfig",
        dependencies = {
            { "williamboman/mason.nvim", config = true },
            "williamboman/mason-lspconfig.nvim",
            "WhoIsSethDaniel/mason-tool-installer.nvim",
            { "j-hui/fidget.nvim",       opts = {} },
            "hrsh7th/cmp-nvim-lsp",
        },
        config = function()
            require("plugins.configs.lsp")
        end,
    },
})

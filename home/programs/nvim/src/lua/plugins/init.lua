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
        "rachartier/tiny-devicons-auto-colors.nvim",
        dependencies = {
            "nvim-tree/nvim-web-devicons",
        },
        event = "VeryLazy",
        config = function()
            require("tiny-devicons-auto-colors").setup()
        end,
    }, -- Icons

    -- File Explorer
    {
        "stevearc/oil.nvim",
        opts = {},
    }, -- File explorer with a buffer-like interface

    -- UI Enhancements
    {
        "akinsho/bufferline.nvim",
        dependencies = { "kyazdani42/nvim-web-devicons" },
        config = function()
            require("plugins.configs.ui.bufferline")
        end,
    }, -- Buffer line at the top of the editor
    {
        "nvim-lualine/lualine.nvim",
        dependencies = { "kyazdani42/nvim-web-devicons" },
        config = function()
            require("plugins.configs.ui.lualine")
        end,
    }, -- Statusline
    {
        "utilyre/barbecue.nvim",
        name = "barbecue",
        version = "*",
        dependencies = { "SmiteshP/nvim-navic" },
    }, -- VS Code-like breadcrumbs bar
    {
        "nvim-tree/nvim-tree.lua",
        config = function()
            require("plugins.configs.ui.nvim-tree")
        end,
        keys = {
            { "<leader>e", "<cmd>NvimTreeToggle<cr>", desc = "NeoTree" },
        },
    }, -- File explorer tree
    {
        "goolord/alpha-nvim",
        config = function()
            require("plugins.configs.ui.alpha")
        end,
    }, -- Start screen
    {
        "folke/trouble.nvim",
        opts = {},
        cmd = "Trouble"
    },
    {
        "folke/noice.nvim",
        event = "VeryLazy",
        opts = {},
        dependencies = {
            "MunifTanjim/nui.nvim",
            -- "rcarriga/nvim-notify",
        },
        config = function()
            require("plugins.configs.ui.noice")
        end,
    }, -- UI for messages, cmdline, and popupmenu
    {
        "petertriho/nvim-scrollbar",
        config = function()
            require("plugins.configs.ui.scrollbar")
        end,
    }, -- Scrollbar with diagnostics and search results

    -- editing helpers
    {
        "kylechui/nvim-surround",
        version = "*", -- use for stability; omit to use `main` branch for the latest features
        event = "VeryLazy",
        config = function()
            require("nvim-surround").setup({})
        end
    }, -- easy surround with {("etc")}
    {
        'numToStr/Comment.nvim',
        opts = {
            mappings = {
                extra = false,
                basic = true,
            },
            toggler = {
                line = "<leader>c"
            },
            opleader = {
                line = "<leader>c"
            }
        }
    },
    {
        "alvan/vim-closetag",
        config = function()
            vim.g.closetag_filenames = "*.html,*.xhtml,*.phtml"
            vim.g.closetag_xhtml_filenames = "*.xhtml,*.jsx"
        end,
    },                                                                   -- Auto-close HTML tags
    { "windwp/nvim-autopairs",   config = true, event = "InsertEnter" }, -- Auto-close brackets, quotes, etc.
    { "windwp/nvim-ts-autotag" },                                        -- Auto-close and rename HTML tags

    -- Navigation and Search
    { "akinsho/toggleterm.nvim", version = "*", opts = { open_mapping = [[<M-l>]] } }, -- Toggle terminal
    {
        "nvim-telescope/telescope.nvim",
        dependencies = {
            "nvim-lua/plenary.nvim",
            "nvim-telescope/telescope-ui-select.nvim",
        },
        config = function()
            require("plugins.configs.telescope")
        end,
    }, -- Fuzzy finder
    {
        "nvim-telescope/telescope-file-browser.nvim",
        dependencies = { "nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim" },
    },                                                                      -- File browser extension for Telescope
    -- Git Integration
    { "lewis6991/gitsigns.nvim",       config = true, event = "BufEnter" }, -- Git signs in the gutter
    {
        "kdheepak/lazygit.nvim",
        keys = {
            { "<leader>gg", "<cmd>LazyGit<cr>", desc = "LazyGit" },
        },
    }, -- LazyGit integration

    -- Miscellaneous
    {
        "smoka7/multicursors.nvim",
        event = "VeryLazy",
        dependencies = {
            "nvimtools/hydra.nvim",
        },
        opts = {},
    },
    {
        "karb94/neoscroll.nvim",
        event = "BufEnter",
        config = function()
            require("neoscroll").setup({})
        end,
    }, -- Smooth scrolling
    {
        "norcalli/nvim-colorizer.lua",
        config = function()
            require("colorizer").setup()
        end,
    }, -- Color highlighter
    {
        "anuvyklack/windows.nvim",
        dependencies = {
            "anuvyklack/middleclass",
            "anuvyklack/animation.nvim",
        },
        config = function()
            vim.o.winwidth = 10
            vim.o.winminwidth = 10
            vim.o.equalalways = false
            require("windows").setup()
        end,
    },                                    -- Window management
    { "christoomey/vim-tmux-navigator" }, -- Vim splits navigation
    { "lewis6991/impatient.nvim" },       -- Speed up loading Lua modules

    -- Syntax and Language Support
    {
        "nvim-treesitter/nvim-treesitter",
        config = function()
            require("plugins.configs.treesitter")
        end,
    }, -- Syntax highlighting and code parsing

    -- Main LSP Configuration and completion
    { -- Autocompletion
        "hrsh7th/nvim-cmp",
        event = "InsertEnter",
        dependencies = {
            -- Snippet Engine & its associated nvim-cmp source
            {
                "L3MON4D3/LuaSnip",
                build = (function()
                    -- Build Step is needed for regex support in snippets.
                    -- This step is not supported in many windows environments.
                    -- Remove the below condition to re-enable on windows.
                    if vim.fn.has("win32") == 1 or vim.fn.executable("make") == 0 then
                        return
                    end
                    return "make install_jsregexp"
                end)(),
                dependencies = {},
            },
            "saadparwaiz1/cmp_luasnip",

            -- Adds other completion capabilities.
            --  nvim-cmp does not ship with all sources by default. They are split
            --  into multiple repos for maintenance purposes.
            "hrsh7th/cmp-nvim-lsp",
            "hrsh7th/cmp-path",
            "onsails/lspkind.nvim",
        },
        config = function()
            require("plugins.configs.cmp")
        end,
        -- See `:help cmp`
    },
    {
        "neovim/nvim-lspconfig",
        dependencies = {
            -- Automatically install LSPs and related tools to stdpath for Neovim
            { "williamboman/mason.nvim", config = true }, -- NOTE: Must be loaded before dependants
            "williamboman/mason-lspconfig.nvim",
            "WhoIsSethDaniel/mason-tool-installer.nvim",

            -- Useful status updates for LSP.
            -- NOTE: `opts = {}` is the same as calling `require('fidget').setup({})`
            { "j-hui/fidget.nvim",       opts = {} },

            -- Allows extra capabilities provided by nvim-cmp
            "hrsh7th/cmp-nvim-lsp",
        },

        config = function()
            require("plugins.configs.lsp")
        end,
    },
})

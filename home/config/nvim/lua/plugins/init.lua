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
            require("plugins.configs.ui.colorscheme")
        end,
    },
    { "sam4llis/nvim-tundra", opts = {}, event = "VeryLazy" },
    { "Everblush/nvim", name = "everblush", opts = {}, event = "VeryLazy" },
    { "projekt0n/github-nvim-theme", name = "github-theme", opts = {}, event = "VeryLazy" },
    { "tiagovla/tokyodark.nvim", opts = {}, event = "VeryLazy" },
    { "rose-pine/neovim", name = "rose-pine", opts = {}, event = "VeryLazy" },
    {
        "goolord/alpha-nvim",
        event = "VimEnter",
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
        event = "VeryLazy",
        dependencies = { "nvim-tree/nvim-web-devicons", "rachartier/tiny-devicons-auto-colors.nvim" },
        config = function()
            require("plugins.configs.ui.bufferline")
        end,
    },
    -- {
    --     "Bekaboo/dropbar.nvim",
    --     event = "VeryLazy",
    --     dependencies = {
    --         "nvim-telescope/telescope-fzf-native.nvim",
    --     },
    -- },
    {
        "famiu/bufdelete.nvim",
        event = "VeryLazy",
    },
    {
        "nvim-lualine/lualine.nvim",
        event = "VeryLazy",
        dependencies = { "kyazdani42/nvim-web-devicons" },
        config = function()
            require("plugins.configs.ui.lualine")
        end,
    },
    {
        "nvim-tree/nvim-tree.lua",
        cmd = { "NvimTreeToggle", "NvimTreeFocus", "NvimTreeFindFile", "NvimTreeCollapse" },
        config = function()
            require("plugins.configs.ui.nvim-tree")
        end,
    },
    {
        "echasnovski/mini.files",
        version = "*",
        event = "VeryLazy",
        config = function()
            require("mini.files").setup({
                options = {
                    use_as_default_explorer = false,
                },
                windows = {
                    preview = true,
                    width_focus = 45,
                    width_nofocus = 30,
                    width_preview = 45,
                },
            })
        end,
    },
    {
        "folke/todo-comments.nvim",
        event = "VeryLazy",
        opts = {},
    },
    {
        "folke/trouble.nvim",
        event = "VeryLazy",
        opts = {},
        cmd = "Trouble",
    },
    {
        "rachartier/tiny-inline-diagnostic.nvim",
        event = "VeryLazy",
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
                    listing_style = "list",
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
            require("plugins.configs.ui.noice")
        end,
    },
    {
        "petertriho/nvim-scrollbar",
        event = "VeryLazy",
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
        event = "VeryLazy",
        config = function()
            require("grug-far").setup({})
        end,
    },
    {
        "smoka7/multicursors.nvim",
        event = "VeryLazy",
        dependencies = { "nvimtools/hydra.nvim" },
        opts = {},
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
        "windwp/nvim-autopairs",
        config = true,
        event = "InsertEnter",
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
        opts = {},
    },
    {
        "akinsho/toggleterm.nvim",
        event = "VeryLazy",
        version = "*",
        opts = { open_mapping = [[<M-l>]], shell = "fish" },
    },
    {
        "natecraddock/workspaces.nvim",
        event = "VeryLazy",
        config = function()
            require("workspaces").setup({ hooks = { open = { "Telescope find_files" } } })
        end,
    },
    {
        "nvim-telescope/telescope.nvim",
        event = "VeryLazy",
        dependencies = {
            "nvim-lua/plenary.nvim",
            "nvim-telescope/telescope-ui-select.nvim",
            "debugloop/telescope-undo.nvim",
        },
        config = function()
            require("plugins.configs.telescope")
        end,
    },
    {
        "nvim-telescope/telescope-file-browser.nvim",
        event = "VeryLazy",
        dependencies = { "nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim" },
    },

    -- Git Integration
    {
        "lewis6991/gitsigns.nvim",
        opts = { current_line_blame = true },
        event = "VeryLazy",
    },
    {
        "kdheepak/lazygit.nvim",
        event = "VeryLazy",
    },

    -- Miscellaneous
    {
        "rachartier/tiny-glimmer.nvim",
        event = "TextYankPost",
        opts = {},
    },
    {
        "declancm/cinnamon.nvim",
        version = "*", -- use latest release
        event = "VeryLazy",
        opts = {
            keymaps = {
                basic = true,
            },
            delay = 1,
            max_delta = {
                column = 1,
                time = 300,
            },
        },
    },
    {
        "vyfor/cord.nvim",
        build = "./build || .\\build",
        event = "VeryLazy",
        opts = {},
    }, -- discord presence
    {
        "brenoprata10/nvim-highlight-colors",
        event = "VeryLazy",
        opts = { enable_tailwind = true },
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
    { "christoomey/vim-tmux-navigator", event = "VeryLazy" },

    -- Syntax and Language Support
    {
        "xiyaowong/virtcolumn.nvim",
        event = "VeryLazy",
    },
    {
        event = "VeryLazy",
        "nvim-treesitter/nvim-treesitter",
        config = function()
            require("plugins.configs.treesitter")
        end,
    },
    {
        "folke/which-key.nvim",
        event = "VeryLazy",
        opts = { delay = 1000, preset = "modern", win = { border = "single" } },
    },

    -- LSP and Completion
    {
        "stevearc/conform.nvim",
        event = { "BufWritePre" },
        cmd = { "ConformInfo" },
        opts = {
            formatters_by_ft = {
                lua = { "stylua" },
                nix = { "nixfmt" },
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
        },
    },
    -- {
    --     "supermaven-inc/supermaven-nvim",
    --     event = "VeryLazy",
    --     config = function()
    --         require("supermaven-nvim").setup({
    --             log_level = "off",
    --             keymaps = { -- NOTE: Keymaps here
    --                 accept_suggestion = "<M-n>",
    --                 clear_suggestion = "<C-]>",
    --                 accept_word = "<C-j>",
    --             },
    --         })
    --     end,
    -- },
    -- {
    --     "zbirenbaum/copilot.lua",
    --     cmd = "Copilot",
    --     event = "InsertEnter",
    --     config = function()
    --         require("copilot").setup({
    --             panel = { enabled = false },
    --             suggestion = {
    --                 enabled = true,
    --                 auto_trigger = true,
    --                 hide_during_completion = true,
    --                 debounce = 75,
    --                 keymap = {
    --                     accept = "<M-i>",
    --                     accept_word = false,
    --                     accept_line = false,
    --                     next = "<M-]>",
    --                     prev = "<M-[>",
    --                     dismiss = "<C-]>",
    --                 },
    --             },
    --         })
    --     end,
    -- },
    {
        "kawre/leetcode.nvim",
        event = "VeryLazy",
        dependencies = {
            "nvim-telescope/telescope.nvim",
            -- "ibhagwan/fzf-lua",
            "nvim-lua/plenary.nvim",
            "MunifTanjim/nui.nvim",
        },
        opts = {
            -- configuration goes here
            lang = "typescript",
            image_support = true,
        },
    },
    {
        "hrsh7th/nvim-cmp",
        event = "VeryLazy",
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
    { "artemave/workspace-diagnostics.nvim", event = "VeryLazy" },
    { "kevinhwang91/nvim-ufo", dependencies = { "kevinhwang91/promise-async" }, event = "VeryLazy" },
    -- LSP configuration (using Neovim 0.11 native API with Nix-installed servers)
    {
        "j-hui/fidget.nvim",
        opts = {},
        config = function()
            require("plugins.configs.lsp")
        end,
    },
})

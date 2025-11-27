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
    {
        "nvim-lualine/lualine.nvim",
        event = "UIEnter",
        dependencies = { "nvim-tree/nvim-web-devicons", "AndreM222/copilot-lualine" },
        config = function()
            require("plugins.configs.lualine")
        end,
    },
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
    -- Utility
    {
        "fei6409/log-highlight.nvim",
        event = "VeryLazy",
        config = function()
            require("log-highlight").setup({})
        end,
    },
    {
        "pocco81/auto-save.nvim",
        event = "VeryLazy",
        opts = {
            execution_message = { message = "" },
        },
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
                -- Options for how hunks are visualized
                view = {
                    -- Visualization style. Possible values are 'sign' and 'number'.
                    -- Default: 'number' if line numbers are enabled, 'sign' otherwise.
                    style = "sign",

                    -- Signs used for hunks with 'sign' view
                    signs = { add = "│", change = "│", delete = "─" },

                    -- Priority of used visualization extmarks
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

    -- Miscellaneous
    {
        "rachartier/tiny-glimmer.nvim",
        event = "BufWritePre",
        config = function()
            require("tiny-glimmer").setup({
                overwrite = {
                    auto_map = true,
                    yank = {
                        enabled = true,
                        default_animation = { name = "fade", settings = { from_color = "RenderMarkdownH6Bg" } },
                    },
                    paste = {
                        enabled = true,
                        default_animation = { name = "fade", settings = { from_color = "RenderMarkdownH3Bg" } },
                    },
                    redo = {
                        enabled = true,
                        default_animation = { name = "fade", settings = { from_color = "RenderMarkdownH4Bg" } },
                    },
                    undo = {
                        enabled = true,
                        default_animation = { name = "fade", settings = { from_color = "RenderMarkdownH1Bg" } },
                    },
                },
                transparency_color = "#121212",

                -- Filetypes to disable hijacking/overwrites
                hijack_ft_disabled = { "snacks_dashboard" },
                virt_text = {
                    priority = 2048, -- Higher values appear above other plugins
                },
            })
        end,
    },
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
    -- LSP and Completion
    -- Modern LSP setup (Neovim 0.11+):
    -- - nvim-lspconfig provides default configs in lsp/ directory
    -- - vim.lsp.config() to override specific servers
    -- - mason-lspconfig calls vim.lsp.enable() automatically
    {
        "neovim/nvim-lspconfig",
        lazy = false,
    },
    {
        "mason-org/mason.nvim",
        lazy = false,
        build = ":MasonUpdate",
        opts = {
            ui = {
                icons = {
                    package_installed = "✓",
                    package_pending = "➜",
                    package_uninstalled = "✗",
                },
            },
        },
    },
    {
        "mason-org/mason-lspconfig.nvim",
        lazy = false,
        dependencies = { "mason-org/mason.nvim", "neovim/nvim-lspconfig" },
        config = function()
            -- Load LSP configuration first (sets up vim.lsp.config overrides before mason-lspconfig enables servers)
            require("plugins.configs.lsp")
        end,
    },
    {
        "WhoIsSethDaniel/mason-tool-installer.nvim",
        dependencies = { "mason-org/mason.nvim" },
        opts = {
            ensure_installed = {},
            auto_update = false,
            run_on_start = false,
        },
    },
    {
        "stevearc/conform.nvim",
        event = { "BufWritePre" },
        cmd = { "ConformInfo" },
        opts = {
            -- Auto-detect formatters: tries each formatter in order, uses first available
            formatters_by_ft = {
                -- Use LSP formatting as fallback
                ["_"] = { "trim_whitespace", "trim_newlines" },

                -- Lua
                lua = { "stylua", stop_after_first = true },

                -- Nix
                nix = { "nixfmt", "alejandra", stop_after_first = true },

                -- Racket
                racket = { "raco_fmt" },

                -- Go
                go = { "goimports", "gofumpt", "gofmt", stop_after_first = true },

                -- JavaScript/TypeScript (tries prettierd, then prettier, then deno)
                javascript = { "prettierd", "prettier", "deno_fmt", stop_after_first = true },
                typescript = { "prettierd", "prettier", "deno_fmt", stop_after_first = true },
                javascriptreact = { "prettierd", "prettier", "deno_fmt", stop_after_first = true },
                typescriptreact = { "prettierd", "prettier", "deno_fmt", stop_after_first = true },

                -- Web frameworks
                svelte = { "prettierd", "prettier", stop_after_first = true },
                astro = { "prettierd", "prettier", stop_after_first = true },
                vue = { "prettierd", "prettier", stop_after_first = true },

                -- Markup/data
                markdown = { "prettierd", "prettier", "deno_fmt", stop_after_first = true },
                json = { "prettierd", "prettier", "deno_fmt", stop_after_first = true },
                jsonc = { "prettierd", "prettier", stop_after_first = true },
                yaml = { "prettierd", "prettier", stop_after_first = true },

                -- Web
                html = { "prettierd", "prettier", stop_after_first = true },
                css = { "prettierd", "prettier", stop_after_first = true },
                scss = { "prettierd", "prettier", stop_after_first = true },

                -- Python
                python = { "ruff_format", "black", "isort", stop_after_first = true },

                -- Rust
                rust = { "rustfmt", stop_after_first = true },

                -- Shell
                sh = { "shfmt", stop_after_first = true },
                bash = { "shfmt", stop_after_first = true },

                -- C/C++
                c = { "clang_format", stop_after_first = true },
                cpp = { "clang_format", stop_after_first = true },

                -- Java
                java = { "google-java-format", stop_after_first = true },
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
        "saghen/blink.cmp",
        version = "*",
        build = "nix run .#build-plugin",
        event = "InsertEnter",
        dependencies = { "rafamadriz/friendly-snippets", "fang2hou/blink-copilot" },
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
                default = { "lsp", "path", "snippets", "buffer", "copilot" },
                providers = {
                    copilot = {
                        name = "copilot",
                        module = "blink-copilot",
                        score_offset = 100,
                        async = true,
                    },
                },
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

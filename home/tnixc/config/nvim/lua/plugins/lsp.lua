-- LSP and completion plugins

return {
    -- LSP configuration
    {
        "neovim/nvim-lspconfig",
        lazy = false,
    },

    -- Mason - LSP installer
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

    -- Formatting
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

    -- Completion
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

    -- LSP utilities
    { "artemave/workspace-diagnostics.nvim", event = "VeryLazy" },
    { "kevinhwang91/nvim-ufo", dependencies = { "kevinhwang91/promise-async" }, event = "VeryLazy" },
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
}

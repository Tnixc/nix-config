-- Setup capabilities for LSP (used by cmp_nvim_lsp)
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = vim.tbl_deep_extend("force", capabilities, require("cmp_nvim_lsp").default_capabilities())

-- Folding configuration for nvim-ufo
vim.o.foldlevel = 99 -- Using ufo provider need a large value, feel free to decrease the value
vim.o.foldlevelstart = 99
vim.o.foldenable = true

capabilities.textDocument.foldingRange = {
    dynamicRegistration = false,
    lineFoldingOnly = true,
}

local foldHandler = function(virtText, lnum, endLnum, width, truncate)
    local newVirtText = {}
    local suffix = (" 󰁂 %d "):format(endLnum - lnum)
    local sufWidth = vim.fn.strdisplaywidth(suffix)
    local targetWidth = width - sufWidth
    local curWidth = 0
    for _, chunk in ipairs(virtText) do
        local chunkText = chunk[1]
        local chunkWidth = vim.fn.strdisplaywidth(chunkText)
        if targetWidth > curWidth + chunkWidth then
            table.insert(newVirtText, chunk)
        else
            chunkText = truncate(chunkText, targetWidth - curWidth)
            local hlGroup = chunk[2]
            table.insert(newVirtText, { chunkText, hlGroup })
            chunkWidth = vim.fn.strdisplaywidth(chunkText)
            -- str width returned from truncate() may less than 2nd argument, need padding
            if curWidth + chunkWidth < targetWidth then
                suffix = suffix .. (" "):rep(targetWidth - curWidth - chunkWidth)
            end
            break
        end
        curWidth = curWidth + chunkWidth
    end
    table.insert(newVirtText, { suffix, "MoreMsg" })
    return newVirtText
end

require("ufo").setup({
    fold_virt_text_handler = foldHandler,
})

-- LSP servers to enable (installed via Nix, except ocamllsp via opam)
local lsp_servers = {
    "lua_ls",
    "vtsls",
    "jsonls",
    "html",
    "cssls",
    "tailwindcss",
    "svelte",
    "astro",
    "pyright",
    "rust_analyzer",
    "gopls",
    "ocamllsp",
}

vim.g.zig_fmt_parse_errors = 0

-- Override floating preview globally
local orig_util_open_floating_preview = vim.lsp.util.open_floating_preview
function vim.lsp.util.open_floating_preview(contents, syntax, opts, ...)
    opts = opts or {}
    opts.border = opts.border or Border("BGFloatBorder")
    opts.header = ""
    return orig_util_open_floating_preview(contents, syntax, opts, ...)
end

-- Configure language servers using Neovim 0.11 native API
local function configure_lsp_servers()
    -- Common on_attach function
    local on_attach = function(client, bufnr)
        require("workspace-diagnostics").populate_workspace_diagnostics(client, bufnr)
    end

    -- Lua Language Server
    vim.lsp.config.lua_ls = {
        cmd = { "lua-language-server" },
        filetypes = { "lua" },
        root_markers = {
            ".luarc.json",
            ".luarc.jsonc",
            ".luacheckrc",
            ".stylua.toml",
            "stylua.toml",
            "selene.toml",
            "selene.yml",
            ".git",
        },
        capabilities = capabilities,
        on_attach = on_attach,
        settings = {
            Lua = {
                runtime = { version = "LuaJIT" },
                workspace = {
                    checkThirdParty = false,
                    library = { vim.env.VIMRUNTIME },
                },
                completion = { callSnippet = "Replace" },
                telemetry = { enable = false },
                diagnostics = { disable = { "missing-fields" } },
            },
        },
    }

    -- TypeScript/JavaScript (vtsls)
    vim.lsp.config.vtsls = {
        cmd = { "vtsls", "--stdio" },
        filetypes = { "javascript", "javascriptreact", "typescript", "typescriptreact", "vue" },
        root_markers = { "package.json", "tsconfig.json", "jsconfig.json", ".git" },
        capabilities = capabilities,
        on_attach = on_attach,
        settings = {
            vtsls = {
                experimental = {
                    completion = {
                        enableServerSideFuzzyMatch = true,
                    },
                },
            },
            typescript = {
                updateImportsOnFileMove = { enabled = "always" },
                suggest = {
                    completeFunctionCalls = true,
                },
                inlayHints = {
                    parameterNames = { enabled = "literals" },
                    parameterTypes = { enabled = true },
                    variableTypes = { enabled = true },
                    propertyDeclarationTypes = { enabled = true },
                    functionLikeReturnTypes = { enabled = true },
                    enumMemberValues = { enabled = true },
                },
            },
            javascript = {
                updateImportsOnFileMove = { enabled = "always" },
                suggest = {
                    completeFunctionCalls = true,
                },
                inlayHints = {
                    parameterNames = { enabled = "literals" },
                    parameterTypes = { enabled = true },
                    variableTypes = { enabled = true },
                    propertyDeclarationTypes = { enabled = true },
                    functionLikeReturnTypes = { enabled = true },
                    enumMemberValues = { enabled = true },
                },
            },
        },
    }

    -- JSON
    vim.lsp.config.jsonls = {
        cmd = { "vscode-json-language-server", "--stdio" },
        filetypes = { "json", "jsonc" },
        root_markers = { ".git" },
        capabilities = capabilities,
        on_attach = on_attach,
    }

    -- HTML
    vim.lsp.config.html = {
        cmd = { "vscode-html-language-server", "--stdio" },
        filetypes = { "html" },
        root_markers = { "package.json", ".git" },
        capabilities = capabilities,
        on_attach = on_attach,
    }

    -- CSS
    vim.lsp.config.cssls = {
        cmd = { "vscode-css-language-server", "--stdio" },
        filetypes = { "css", "scss", "less" },
        root_markers = { "package.json", ".git" },
        capabilities = capabilities,
        on_attach = on_attach,
    }

    -- Tailwind CSS
    vim.lsp.config.tailwindcss = {
        cmd = { "tailwindcss-language-server", "--stdio" },
        filetypes = {
            "html",
            "css",
            "scss",
            "javascript",
            "javascriptreact",
            "typescript",
            "typescriptreact",
            "vue",
            "svelte",
            "astro",
        },
        root_markers = {
            "tailwind.config.js",
            "tailwind.config.ts",
            "postcss.config.js",
            "postcss.config.ts",
            "package.json",
            ".git",
        },
        capabilities = capabilities,
        on_attach = on_attach,
    }

    -- Svelte
    vim.lsp.config.svelte = {
        cmd = { "svelteserver", "--stdio" },
        filetypes = { "svelte" },
        root_markers = { "package.json", ".git" },
        capabilities = capabilities,
        on_attach = on_attach,
    }

    -- Astro
    vim.lsp.config.astro = {
        cmd = { "astro-ls", "--stdio" },
        filetypes = { "astro" },
        root_markers = { "package.json", "astro.config.mjs", ".git" },
        capabilities = capabilities,
        on_attach = on_attach,
    }

    -- Python
    vim.lsp.config.pyright = {
        cmd = { "pyright-langserver", "--stdio" },
        filetypes = { "python" },
        root_markers = { "pyproject.toml", "setup.py", "setup.cfg", "requirements.txt", "Pipfile", ".git" },
        capabilities = capabilities,
        on_attach = on_attach,
    }

    -- Rust
    vim.lsp.config.rust_analyzer = {
        cmd = { "rust-analyzer" },
        filetypes = { "rust" },
        root_markers = { "Cargo.toml", ".git" },
        capabilities = capabilities,
        on_attach = on_attach,
    }

    -- Go
    vim.lsp.config.gopls = {
        cmd = { "gopls" },
        filetypes = { "go", "gomod", "gowork", "gotmpl" },
        root_markers = { "go.work", "go.mod", ".git" },
        capabilities = capabilities,
        on_attach = on_attach,
    }

    -- OCaml (installed per opam switch)
    vim.lsp.config.ocamllsp = {
        cmd = { "ocamllsp" },
        filetypes = { "ocaml", "ocaml.menhir", "ocaml.interface", "ocamllex", "reason", "dune" },
        root_markers = {
            "*.opam",
            "esy.json",
            "package.json",
            ".git",
            "dune-project",
            "dune-workspace",
            "*.ml",
        },
        capabilities = capabilities,
        on_attach = on_attach,
    }
end

-- Call configuration function
configure_lsp_servers()

-- Enable all configured language servers
vim.lsp.enable(lsp_servers)

local signs = {
    ERROR = " 􀻀 ",
    WARN = " 􀘰 ",
    HINT = " 󰌵 ",
    INFO = " 􀅵 ",
}

vim.diagnostic.config({
    -- vim.fn.sign_define("DiagnosticSignError", { text = "􀃰", texthl = "DiagnosticSignError" })
    -- vim.fn.sign_define("DiagnosticSignWarn", { text = "􀃮", texthl = "DiagnosticSignWarn" })
    -- vim.fn.sign_define("DiagnosticSignInfo", { text = "􁊇", texthl = "DiagnosticSignInfo" })
    -- vim.fn.sign_define("DiagnosticSignHint", { text = "􁇖", texthl = "DiagnosticSignHint" })
    signs = {
        text = {
            [vim.diagnostic.severity.ERROR] = "􀃰",
            [vim.diagnostic.severity.WARN] = "􀃮",
            [vim.diagnostic.severity.INFO] = "􁊇",
            [vim.diagnostic.severity.HINT] = "􁇖",
        },
    },

    virtual_text = {
        prefix = function(diagnostic)
            return signs[vim.diagnostic.severity[diagnostic.severity]]
        end,
    },
})

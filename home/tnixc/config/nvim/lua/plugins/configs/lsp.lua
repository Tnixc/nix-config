-- Setup capabilities for LSP (used by blink.cmp)
local capabilities = require("blink.cmp").get_lsp_capabilities()

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

vim.g.zig_fmt_parse_errors = 0

-- Common on_attach function
local on_attach = function(client, bufnr)
    require("workspace-diagnostics").populate_workspace_diagnostics(client, bufnr)
end

-- Configure servers with custom settings BEFORE mason-lspconfig auto-enables them
-- These configs are used when mason-lspconfig calls vim.lsp.enable() for installed servers
-- Set default config for all servers (wildcard pattern)
-- Any server without specific config above will inherit these settings
vim.lsp.config("*", {
    capabilities = capabilities,
    on_attach = on_attach,
})

-- Mason-lspconfig v2.x: automatically calls vim.lsp.enable() for all installed servers
-- For each server, it uses: nvim-lspconfig defaults + your vim.lsp.config() overrides
require("mason-lspconfig").setup()

-- Non-Mason LSPs (installed via other package managers)
-- For servers not managed by Mason, define config AND manually enable them

-- Racket (installed via racket package manager)
vim.lsp.config("racket_langserver", {
    cmd = { "racket", "-l", "racket-langserver" },
    capabilities = capabilities,
    on_attach = on_attach,
})
vim.lsp.enable("racket_langserver") -- Manually enable since not managed by Mason

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
})

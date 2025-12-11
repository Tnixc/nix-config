local status_ok, treesitter = pcall(require, "nvim-treesitter")
if not status_ok then
    return
end

local status_ok, configs = pcall(require, "nvim-treesitter.configs")
if not status_ok then
    return
end

configs.setup({
    -- ensure_installed = { "rust", "lua", "markdown", "markdown_inline", "bash", "python" }, -- put the language you want in this array
    ensure_installed = "all", -- one of "all" or a list of languages
    ignore_install = { "ipkg" }, -- List of parsers to ignore installing
    sync_install = false, -- install languages synchronously (only applied to `ensure_installed`)

    highlight = {
        enable = true, -- false will disable the whole extension
    },
    autopairs = {
        enable = true,
    },
    autotags = {
        enable = true,
        filetypes = { "html", "xml" },
    },
    indent = { enable = true, disable = { "python", "css" } },

    context_commentstring = {
        enable = true,
        enable_autocmd = true,
    },
})

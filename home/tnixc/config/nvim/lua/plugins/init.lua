-- Plugin manager setup and plugin imports

local ok, lazy = pcall(require, "lazy")
if not ok then
    return
end

-- Helper function for borders (used in plugin configs)
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

-- Setup lazy.nvim with all plugin specs
lazy.setup({
    { import = "plugins.ui" },
    { import = "plugins.editor" },
    { import = "plugins.lsp" },
    { import = "plugins.tools" },
}, {
    root = vim.fn.stdpath("data") .. "/lazy",
})

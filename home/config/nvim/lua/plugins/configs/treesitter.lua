local status_ok, treesitter = pcall(require, "nvim-treesitter")
if not status_ok then
    return
end

-- NOTE: This config targets the nvim-treesitter `main` branch (see tools.lua),
-- which is a full rewrite. The old `require("nvim-treesitter.configs").setup{
-- highlight = { enable = true }, ... }` API no longer exists. Highlighting and
-- indentation are now opt-in *per buffer*, so we start them ourselves on
-- FileType. Without this, no treesitter highlighter is ever created: Neovim
-- falls back to regex `:syntax` (punctuation shows up uncoloured) and
-- rainbow-delimiters never sees a parse, so it only renders after :InspectTree.

-- Ensure all parsers are installed (minus `ipkg`, which we never want — this
-- mirrors the old `ignore_install`). `install` runs asynchronously and skips
-- parsers that are already present, so this is cheap on every startup and only
-- does real work on a fresh machine.
local langs = vim.tbl_filter(function(lang)
    return lang ~= "ipkg"
end, treesitter.get_available())
treesitter.install(langs)

-- Treesitter indentation is experimental and misbehaves for these filetypes,
-- so keep Vim's built-in indenting there (mirrors the old `indent.disable`).
local no_ts_indent = {
    python = true,
    css = true,
}

-- Start treesitter highlighting (and indentation) for any buffer whose parser
-- is available.
vim.api.nvim_create_autocmd("FileType", {
    desc = "Enable treesitter highlighting/indentation",
    callback = function(args)
        local buf = args.buf
        local lang = vim.treesitter.language.get_lang(vim.bo[buf].filetype)
        -- `language.add` returns false (without erroring) when the parser for
        -- this language isn't installed, which also skips plain-text buffers,
        -- dashboards, etc.
        if not lang or not vim.treesitter.language.add(lang) then
            return
        end

        vim.treesitter.start(buf, lang)

        if not no_ts_indent[lang] then
            vim.bo[buf].indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
        end
    end,
})

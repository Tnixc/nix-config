vim.loader.enable()
-- For options & keymappings & coloring
-- options & settings for neovim
require("options")

-- Install the Lazy Plugins Manager
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "--single-branch",
        "https://github.com/folke/lazy.nvim.git",
        lazypath,
    })
end

vim.opt.runtimepath:prepend(lazypath)

-- Where you can intall and modify your plugins
require("plugins")

-- Keybindings
require("mappings")

-- Filetype-specific settings
require("ft")

local parser_config = require("nvim-treesitter.parsers").get_parser_configs()

parser_config.elle = {
    install_info = {
        url = "~/Developer/tree-sitter-elle", -- local path or git repo
        files = { "src/parser.c" }, -- note that some parsers also require src/scanner.c or src/scanner.cc
        -- optional entries:
        branch = "main", -- default branch in case of git repo if different from master
        generate_requires_npm = false, -- if stand-alone parser without npm dependencies
        requires_generate_from_grammar = false, -- if folder contains pre-generated src/parser.c
    },
    filetype = "le", -- if filetype does not match the parser name
}

vim.filetype.add({
    extension = {
        le = "le",
    },
})

vim.loader.enable()
-- For options & keymappings & coloring
-- options & settings for neovim
require("core.options")

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
require("core.mappings")
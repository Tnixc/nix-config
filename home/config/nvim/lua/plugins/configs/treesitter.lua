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

local parser_config = require("nvim-treesitter.parsers").get_parser_configs()
parser_config.elle = {
	install_info = {
		url = "/Users/tnixc/Developer/tree-sitter-elle", -- local path or git repo
		files = { "src/parser.c" }, -- note that some parsers also require src/scanner.c or src/scanner.cc
		-- optional entries:
		branch = "mistress", -- default branch in case of git repo if different from master
		generate_requires_npm = false, -- if stand-alone parser without npm dependencies
		requires_generate_from_grammar = false, -- if folder contains pre-generated src/parser.c
	},
	filetype = "le", -- if filetype does not match the parser name
}

vim.treesitter.language.register('elle', 'le')  -- the someft filetype will use the python parser and queries.

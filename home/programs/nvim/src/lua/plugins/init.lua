local ok, lazy = pcall(require, "lazy")
if not ok then
	return
end

lazy.setup({
	root = vim.fn.stdpath("data") .. "/lazy",

	-- File Explorer
	{
		"stevearc/oil.nvim",
		opts = {},
	}, -- File explorer with a buffer-like interface
	-- Appearance
	{
		"marko-cerovac/material.nvim",
		lazy = false,
		priority = 1000,
		config = function()
			require("plugins.configs.ui.colorscheme")
		end,
	},
	{
		"rachartier/tiny-devicons-auto-colors.nvim",
		dependencies = {
			"nvim-tree/nvim-web-devicons",
		},
		event = "VeryLazy",
		config = function()
			require("tiny-devicons-auto-colors").setup()
		end,
	}, -- Icons

	-- UI Enhancements
	{
		"akinsho/bufferline.nvim",
		dependencies = { "kyazdani42/nvim-web-devicons" },
		config = function()
			require("plugins.configs.ui.bufferline")
		end,
	}, -- Buffer line at the top of the editor
	{
		"nvim-lualine/lualine.nvim",
		dependencies = { "kyazdani42/nvim-web-devicons" },
		config = function()
			require("plugins.configs.ui.lualine")
		end,
	}, -- Statusline
	{
		"utilyre/barbecue.nvim",
		name = "barbecue",
		version = "*",
		dependencies = { "SmiteshP/nvim-navic" },
	}, -- VS Code-like breadcrumbs bar
	{
		"nvim-tree/nvim-tree.lua",
		config = function()
			require("plugins.configs.ui.nvim-tree")
		end,
		keys = {
			{ "<leader>e", "<cmd>NvimTreeToggle<cr>", desc = "NeoTree" },
		},
	}, -- File explorer tree
	{
		"lukas-reineke/indent-blankline.nvim",
		main = "ibl",
		opts = {},
	}, -- Indentation guides
	{
		"goolord/alpha-nvim",
		config = function()
			require("plugins.configs.ui.alpha")
		end,
	}, -- Start screen
	{
		"folke/noice.nvim",
		event = "VeryLazy",
		opts = {},
		dependencies = {
			"MunifTanjim/nui.nvim",
			"rcarriga/nvim-notify",
		},
		config = function()
			require("plugins.configs.ui.noice")
		end,
	}, -- UI for messages, cmdline, and popupmenu
	{
		"petertriho/nvim-scrollbar",
		config = function()
			require("plugins.configs.ui.scrollbar")
		end,
	}, -- Scrollbar with diagnostics and search results

	-- Editing Helpers
	{
		"alvan/vim-closetag",
		config = function()
			vim.g.closetag_filenames = "*.html,*.xhtml,*.phtml"
			vim.g.closetag_xhtml_filenames = "*.xhtml,*.jsx"
		end,
	}, -- Auto-close HTML tags
	{ "windwp/nvim-autopairs", config = true, event = "InsertEnter" }, -- Auto-close brackets, quotes, etc.
	{ "numToStr/Comment.nvim", config = true, event = "BufEnter" }, -- Easy commenting
	{ "windwp/nvim-ts-autotag" }, -- Auto-close and rename HTML tags

	-- Navigation and Search
	{ "akinsho/toggleterm.nvim", version = "*", opts = { open_mapping = [[<M-l>]]} }, -- Toggle terminal
	{
		"nvim-telescope/telescope.nvim",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-telescope/telescope-ui-select.nvim",
		},
		config = function()
			require("plugins.configs.telescope")
		end,
	}, -- Fuzzy finder
	{
		"nvim-telescope/telescope-file-browser.nvim",
		dependencies = { "nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim" },
	}, -- File browser extension for Telescope
	{
		"nvim-telescope/telescope-frecency.nvim",
		config = function()
			require("telescope").load_extension("frecency")
		end,
		dependencies = { "kkharji/sqlite.lua" },
	}, -- Frecency algorithm for Telescope
	{ "ahmedkhalf/project.nvim" }, -- Project management

	-- Git Integration
	{ "lewis6991/gitsigns.nvim", config = true, event = "BufEnter" }, -- Git signs in the gutter
	{
		"kdheepak/lazygit.nvim",
		keys = {
			{ "<leader>gg", "<cmd>LazyGit<cr>", desc = "NeoTree" },
		},
	}, -- LazyGit integration

	-- Miscellaneous
	{
		"karb94/neoscroll.nvim",
		event = "BufEnter",
		config = function()
			require("neoscroll").setup({})
		end,
	}, -- Smooth scrolling
	{
		"norcalli/nvim-colorizer.lua",
		config = function()
			require("colorizer").setup({
				user_dafault_options = {
					tailwind = true,
				},
			})
		end,
	}, -- Color highlighter
	{
		"anuvyklack/windows.nvim",
		dependencies = {
			"anuvyklack/middleclass",
			"anuvyklack/animation.nvim",
		},
		config = function()
			vim.o.winwidth = 10
			vim.o.winminwidth = 10
			vim.o.equalalways = false
			require("windows").setup()
		end,
	}, -- Window management
	{ "christoomey/vim-tmux-navigator" }, -- Vim splits navigation
	{ "lewis6991/impatient.nvim" }, -- Speed up loading Lua modules

	-- Syntax and Language Support
	{
		"nvim-treesitter/nvim-treesitter",
		config = function()
			require("plugins.configs.treesitter")
		end,
	}, -- Syntax highlighting and code parsing

	-- LSP stuff
	{ "williamboman/mason.nvim" },
	{ "williamboman/mason-lspconfig.nvim" },
	{ "neovim/nvim-lspconfig" },
	{ "hrsh7th/cmp-nvim-lsp" },
	{ "hrsh7th/nvim-cmp" },
})

require("plugins.configs.lsp")

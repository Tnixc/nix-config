local ok, lazy = pcall(require, "lazy")
if not ok then
	return
end

lazy.setup({
	root = vim.fn.stdpath("data") .. "/lazy",
	{
		"stevearc/oil.nvim",
		opts = {},
	},
	{
		"rose-pine/neovim",
		name = "rose-pine",
		lazy = false,
		priority = 1000,
		config = function()
			require("plugins.configs.colorschemes")
		end,
	},
	{
		"akinsho/bufferline.nvim",
		dependencies = {
			"kyazdani42/nvim-web-devicons",
		},
		config = function()
			require("plugins.configs.ui.bufferline")
		end,
	},
	{
		"nvim-lualine/lualine.nvim",
		dependencies = {
			"kyazdani42/nvim-web-devicons",
		},
		config = function()
			require("plugins.configs.ui.lualine")
		end,
	},
	{
		"utilyre/barbecue.nvim",
		name = "barbecue",
		version = "*",
		dependencies = {
			"SmiteshP/nvim-navic",
		},
	},
	{
		"nvim-tree/nvim-tree.lua",
		config = function()
			require("plugins.configs.ui.nvim-tree")
		end,
		keys = {
			{ "<leader>e", "<cmd>NvimTreeToggle<cr>", desc = "NeoTree" },
		},
	},
	{
		"lukas-reineke/indent-blankline.nvim",
		main = "ibl",
		---@module "ibl"
		---@type ibl.config
		opts = {},
	},
	{
		"alvan/vim-closetag",
		config = function()
			vim.g.closetag_filenames = "*.html,*.xhtml,*.phtml"
			vim.g.closetag_xhtml_filenames = "*.xhtml,*.jsx"
		end,
	},
	{ "windwp/nvim-autopairs", config = true, event = "InsertEnter" },
	{
		"nvim-telescope/telescope.nvim",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-telescope/telescope-ui-select.nvim",
		},
		config = function()
			require("plugins.configs.telescope")
		end,
	},
	{
		"nvim-telescope/telescope-file-browser.nvim",
		dependencies = { "nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim" },
	},
	{
		"nvim-telescope/telescope-frecency.nvim",
		config = function()
			require("telescope").load_extension("frecency")
		end,
		dependencies = { "kkharji/sqlite.lua" },
	},
	{ "ahmedkhalf/project.nvim" },
	{ "numToStr/Comment.nvim", config = true, event = "BufEnter" },
	{ "lewis6991/gitsigns.nvim", config = true, event = "BufEnter" },
	{
		"kdheepak/lazygit.nvim",
		keys = {
			{ "<leader>gg", "<cmd>LazyGit<cr>", desc = "NeoTree" },
		},
	},

	{
		"karb94/neoscroll.nvim",
		event = "BufEnter",
		config = function()
			require("neoscroll").setup({})
		end,
	},
	{
		"norcalli/nvim-colorizer.lua",
		config = function()
			require("colorizer").setup({
				user_dafault_options = {
					tailwind = true,
				},
			})
		end,
	},
	{
		"petertriho/nvim-scrollbar",
		config = function()
			require("plugins.configs.ui.scrollbar")
		end,
	},
	{
		"goolord/alpha-nvim",
		config = function()
			require("plugins.configs.ui.alpha")
		end,
	},
	{
		"lewis6991/impatient.nvim",
	},
	{
		"nvim-treesitter/nvim-treesitter",
		config = function()
			require("plugins.configs.treesitter")
		end,
	},
	{ "windwp/nvim-ts-autotag" },
	{
		"iamcco/markdown-preview.nvim",
		init = function()
			vim.g.mkdp_filetypes = { "markdown" }
		end,
		ft = { "markdown" },
	},
	{ "github/copilot.vim" },
	{
		"christoomey/vim-tmux-navigator",
	},
	{
		"folke/noice.nvim",
		event = "VeryLazy",
		opts = {
			-- add any options here
		},
		dependencies = {
			-- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
			"MunifTanjim/nui.nvim",
			-- OPTIONAL:
			--   `nvim-notify` is only needed, if you want to use the notification view.
			--   If not available, we use `mini` as the fallback
			"rcarriga/nvim-notify",
		},
		config = function()
			require("plugins.configs.ui.noice")
		end,
	},
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
	},
	{
		"folke/flash.nvim",
		event = "VeryLazy",
		---@type Flash.Config
		opts = {},
		keys = {
			{
				"s",
				mode = { "n", "x", "o" },
				function()
					-- default options: exact mode, multi window, all directions, with a backdrop
					require("flash").jump()
				end,
			},
			{
				"S",
				mode = { "o", "x" },
				function()
					require("flash").treesitter()
				end,
			},
		},
	},
	{
		"ChristianChiarulli/onedark.nvim",
	},
	{
		"marko-cerovac/material.nvim",
	},
})

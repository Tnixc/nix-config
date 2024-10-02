local ok, lazy = pcall(require, "lazy")
if not ok then
	return
end
lazy.setup({
	root = vim.fn.stdpath("data") .. "/lazy",

	-- Appearance
	{
		"catppuccin/nvim",
		name = "catppuccin",
		priority = 1000,
		config = function()
			require("plugins.configs.ui.colorscheme")
		end,
	},
	{
		"goolord/alpha-nvim",
		config = function()
			require("plugins.configs.ui.alpha")
		end,
	},
	{
		"rachartier/tiny-devicons-auto-colors.nvim",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		event = "VeryLazy",
		config = function()
			require("tiny-devicons-auto-colors").setup({})
		end,
	},

	-- UI Enhancements
	{
		"akinsho/bufferline.nvim",
		dependencies = { "kyazdani42/nvim-web-devicons" },
		config = function()
			require("plugins.configs.ui.bufferline")
		end,
	},
	{
		"Bekaboo/dropbar.nvim",
		event = "VeryLazy",
		dependencies = {
			"nvim-telescope/telescope-fzf-native.nvim",
		},
	},
	{
		"famiu/bufdelete.nvim",
		event = "VeryLazy",
	},
	{
		"nvim-lualine/lualine.nvim",
		dependencies = { "kyazdani42/nvim-web-devicons" },
		config = function()
			require("plugins.configs.ui.lualine")
		end,
	},
	{
		"nvim-tree/nvim-tree.lua",
		event = "BufEnter",
		config = function()
			require("plugins.configs.ui.nvim-tree")
		end,
	},
	{
		"echasnovski/mini.files",
		version = "*",
		event = "VeryLazy",
		config = function()
			require("mini.files").setup({
				options = {
					use_as_default_explorer = true,
				},
				windows = {
					preview = true,
					width_focus = 45,
					width_nofocus = 30,
					width_preview = 45,
				},
			})
		end,
	},
	{
		"folke/todo-comments.nvim",
		event = "VeryLazy",
		opts = {},
	},
	{
		"folke/trouble.nvim",
		event = "VeryLazy",
		opts = {},
		cmd = "Trouble",
	},
	{
		"sindrets/diffview.nvim",
		event = "VeryLazy",
		config = function()
			require("diffview").setup({
				file_panel = {
					listing_style = "list",
					win_config = {
						position = "right",
						width = 30,
						win_opts = {},
					},
				},
			})
		end,
	},
	{ "HiPhish/rainbow-delimiters.nvim", event = "VeryLazy" },
	{
		"folke/noice.nvim",
		event = "VeryLazy",
		opts = {},
		dependencies = { "MunifTanjim/nui.nvim" },
		config = function()
			require("plugins.configs.ui.noice")
		end,
	},
	{
		"petertriho/nvim-scrollbar",
		event = "VeryLazy",
		opts = {},
	},

	-- Utility
	{
		"nullishamy/autosave.nvim",
		event = "VeryLazy",
		config = function()
			require("autosave").setup({})
		end,
	},
	{
		"willothy/moveline.nvim",
		event = "VeryLazy",
		build = "make",
	},

	-- Editing Helpers
	{
		"smoka7/multicursors.nvim",
		event = "VeryLazy",
		dependencies = { "nvimtools/hydra.nvim" },
		opts = {},
	},
	{
		"kylechui/nvim-surround",
		version = "*",
		event = "VeryLazy",
		config = function()
			require("nvim-surround").setup({ keymaps = { visual = "s" } }) -- NOTE: Keymaps here
		end,
	},
	{
		"numToStr/Comment.nvim",
		event = "VeryLazy",
		config = function()
			require("Comment").setup({
				toggler = { line = "<D-/>" },
				opleader = { line = "<D-/>" },
				mappings = { extra = false, basic = true },
			})
		end,
	},
	{
		"alvan/vim-closetag",
		event = "InsertEnter",
		config = function()
			vim.g.closetag_filenames = "*.vue,*.svelte,*.html,*.xhtml,*.phtml"
			vim.g.closetag_xhtml_filenames = "*.xhtml,*.jsx"
		end,
	},
	{
		"windwp/nvim-autopairs",
		config = true,
		event = "InsertEnter",
	},
	{
		"windwp/nvim-ts-autotag",
		event = "InsertEnter",
		opts = {},
	},

	-- Navigation and Search
	{
		"folke/persistence.nvim",
		event = "BufReadPre", -- this will only start session saving when an actual file was opened
		opts = {
			-- add any custom options here
		},
	},
	{
		"akinsho/toggleterm.nvim",
		event = "VeryLazy",
		version = "*",
		opts = { open_mapping = [[<M-l>]] },
	},
	{
		"natecraddock/workspaces.nvim",
		event = "VeryLazy",
		config = function()
			require("workspaces").setup({ hooks = { open = { "Telescope find_files" } } })
		end,
	},
	{
		"nvim-telescope/telescope.nvim",
		event = "VeryLazy",
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
		event = "VeryLazy",
		dependencies = { "nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim" },
	},

	-- Git Integration
	{
		"lewis6991/gitsigns.nvim",
		config = true,
		event = "VeryLazy",
	},
	{
		"kdheepak/lazygit.nvim",
		event = "VeryLazy",
	},

	-- Miscellaneous
	{
		"vyfor/cord.nvim",
		build = "./build || .\\build",
		event = "VeryLazy",
		opts = {},
	}, -- discord presence
	{
		"karb94/neoscroll.nvim",
		event = "VeryLazy",
		config = function()
			require("neoscroll").setup({})
		end,
	},
	{
		"brenoprata10/nvim-highlight-colors",
		event = "VeryLazy",
		opts = { enable_tailwind = true },
	},
	{
		"nacro90/numb.nvim",
		opts = {},
		event = "VeryLazy",
	},
	{
		"MeanderingProgrammer/render-markdown.nvim",
		event = "VeryLazy",
		opts = {
			heading = {
				width = "block",
				left_pad = 1,
				right_pad = 2,
				position = "inline",
			},
			code = {
				width = "block",
				left_pad = 2,
				right_pad = 2,
			},
		},
		dependencies = { "nvim-treesitter/nvim-treesitter", "nvim-tree/nvim-web-devicons" },
	},
	{
		"anuvyklack/windows.nvim",
		event = "VeryLazy",
		dependencies = { "anuvyklack/middleclass", "anuvyklack/animation.nvim" },
		config = function()
			vim.o.winwidth = 10
			vim.o.winminwidth = 10
			vim.o.equalalways = false
			require("windows").setup({})
		end,
	},
	{ "christoomey/vim-tmux-navigator", event = "VeryLazy" },

	-- Syntax and Language Support
	{
		event = "VeryLazy",
		"nvim-treesitter/nvim-treesitter",
		config = function()
			require("plugins.configs.treesitter")
		end,
	},
	{
		"folke/which-key.nvim",
		event = "VeryLazy",
		opts = { delay = 1000, preset = "modern", win = { border = "single" } },
	},

	-- LSP and Completion
	{
		"supermaven-inc/supermaven-nvim",
		event = "VeryLazy",
		config = function()
			require("supermaven-nvim").setup({
				log_level = "off",
				keymaps = { -- NOTE: Keymaps here
					accept_suggestion = "<M-n>",
					clear_suggestion = "<C-]>",
					accept_word = "<C-j>",
				},
			})
		end,
	},
	{
		"hrsh7th/nvim-cmp",
		event = "VeryLazy",
		dependencies = {
			{
				"L3MON4D3/LuaSnip",
				build = (function()
					if vim.fn.has("win32") == 1 or vim.fn.executable("make") == 0 then
						return
					end
					return "make install_jsregexp"
				end)(),
			},
			"saadparwaiz1/cmp_luasnip",
			"hrsh7th/cmp-nvim-lsp",
			"hrsh7th/cmp-path",
			"onsails/lspkind.nvim",
		},
		config = function()
			require("plugins.configs.cmp")
		end,
	},
	{
		"neovim/nvim-lspconfig",
        event = "VeryLazy",
		dependencies = {
			{ "williamboman/mason.nvim", config = true },
			"williamboman/mason-lspconfig.nvim",
			"WhoIsSethDaniel/mason-tool-installer.nvim",
			{ "j-hui/fidget.nvim", opts = {} },
			"hrsh7th/cmp-nvim-lsp",
		},
		config = function()
			require("plugins.configs.lsp")
		end,
	},
})

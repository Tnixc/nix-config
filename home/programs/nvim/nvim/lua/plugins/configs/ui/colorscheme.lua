require("catppuccin").setup({
	integrations = {
		diffview = true,
		mason = true,
		noice = true,
		notifier = true,
		notify = true,
		telescope = {
			enabled = true,
			style = "nvchad",
		},
		lsp_trouble = true,
		which_key = true,
	},
	color_overrides = {
		macchiato = {
			rosewater = "#E6A5C9",
			flamingo = "#E46876",
			pink = "#D98AAD",
			mauve = "#A292A3",
			red = "#E46876",
			maroon = "#C4746E",
			peach = "#E6A96D",
			yellow = "#E6C384",
			green = "#87A987",
			teal = "#7AA89F",
			sky = "#8BA4B0",
			sapphire = "#7FB4CA",
			blue = "#7F94B4",
			lavender = "#938AA9",
			text = "#C5C9C5",
			subtext1 = "#A6A69C",
			subtext0 = "#99A4CC",
		},
	},
	custom_highlights = function(colors)
		return {
			FloatBorder = { fg = colors.overlay0 },
			BGFloatBorder = { fg = colors.surface1, bg = colors.mantle },
			MultiCursor = { fg = colors.maroon, bg = colors.crust },
			MultiCursorMain = { fg = colors.red, bg = colors.crust },
			Folded = { fg = colors.sapphire, bg = colors.mantle },
			UfoFoldedBg = { bg = colors.surface0 },
		}
	end,
})

vim.cmd("colorscheme catppuccin-macchiato")

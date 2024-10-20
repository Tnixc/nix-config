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
			rosewater = "#FAA296",
			flamingo = "#FF6A7B",
			pink = "#FF9ED0",
			mauve = "#C198FD",
			red = "#FF6A7B",
			maroon = "#FF7DAA",
			peach = "#FF9856",
			yellow = "#E9AD5B",
			green = "#90D05A",
			teal = "#41DDCA",
			sky = "#05D1EC",
			sapphire = "#62E4FF",
			blue = "#6EA3FE",
			lavender = "#8995FF",
			text = "#BECAF9",
			subtext1 = "#A7B1D9",
			subtext0 = "#99A4CC",
		},
	},
	custom_highlights = function(colors)
		return {
			FloatBorder = { fg = colors.overlay0 },
			RedFloatBorder = { fg = "#B35163", bg = colors.mantle },
			MultiCursor = { fg = colors.maroon, bg = colors.crust },
			MultiCursorMain = { fg = colors.red, bg = colors.crust },
		}
	end,
})

vim.cmd("colorscheme catppuccin-macchiato")

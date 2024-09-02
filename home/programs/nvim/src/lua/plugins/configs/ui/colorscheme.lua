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
			rosewater = "#ffbe91",
			flamingo = "#f0b4b4",
			pink = "#f0aadd",
			mauve = "#c198fd",
			red = "#ff6c8d",
			maroon = "#ff8bb3",
			peach = "#ff9856",
			yellow = "#e9ad5b",
			green = "#90d05a",
			teal = "#41ddca",
			sky = "#00bcdb",
			sapphire = "#5ed2ff",
			blue = "#6ea3fe",
			lavender = "#98a4f5",
			text = "#becaf9",
			subtext1 = "#b5c9ff",
			subtext0 = "#aabbe3",
		},
	},
	custom_highlights = function(colors)
		return {
			FloatBorder = { fg = colors.overlay0 },
			MultiCursor = { fg = colors.maroon, bg = colors.crust },
			MultiCursorMain = { fg = colors.red, bg = colors.crust },
		}
	end,
})

vim.cmd("colorscheme catppuccin-macchiato")

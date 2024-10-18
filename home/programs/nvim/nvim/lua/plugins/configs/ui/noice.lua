require("noice").setup({
	messages = {
		-- NOTE: If you enable messages, then the cmdline is enabled automatically.
		-- This is a current Neovim limitation.
		enabled = true, -- enables the Noice messages UI
		view = "mini", -- default view for messages
		view_error = "mini", -- view for errors
		view_warn = "mini", -- view for warnings
		view_history = "messages", -- view for :messages
		view_search = "virtualtext", -- view for search count messages. Set to `false` to disable
	},
	cmdline = {
		view = "cmdline",
		format = {
			cmdline = { pattern = "^:", icon = "󰘳 ", lang = "vim" },
			search_down = { kind = "search", pattern = "^/", icon = "󰩊 ", lang = "regex" },
			search_up = { kind = "search", pattern = "^%?", icon = "󰩊 ", lang = "regex" },
			filter = { pattern = "^:%s*!", icon = "󰻿 ", lang = "bash" },
			lua = { pattern = { "^:%s*lua%s+", "^:%s*lua%s*=%s*", "^:%s*=%s*" }, icon = "", lang = "lua" },
			help = { pattern = "^:%s*he?l?p?%s+", icon = "󰞋 " },
		},
	},
})

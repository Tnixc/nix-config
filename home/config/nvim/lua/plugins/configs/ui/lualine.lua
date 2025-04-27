-- Eviline config for lualine
-- Author: shadmansaleh
-- Credit: glepnir
-- Color table for highlights
-- stylua: ignore
local colors = {
  red      = '#CB7676',
  orange   = '#CC8D70',
  yellow   = '#B8A865',
  green    = '#80A665',
  cyan     = '#5EA994',
  sapphire = '#6394BF',
  blue     = '#687eaa',
  purple   = '#6872AB',
  magenta  = '#D98AAD',
  bg       = '#0A0A0A',
  fg       = '#D8D6C9',
}

local conditions = {
	buffer_not_empty = function()
		return vim.fn.empty(vim.fn.expand("%:t")) ~= 1
	end,
	hide_in_width = function()
		return vim.fn.winwidth(0) > 80
	end,
	check_git_workspace = function()
		local filepath = vim.fn.expand("%:p:h")
		local gitdir = vim.fn.finddir(".git", filepath .. ";")
		return gitdir and #gitdir > 0 and #gitdir < #filepath
	end,
}

-- Config
local config = {
	options = {
		-- Disable sections and component separators
		component_separators = "",
		section_separators = "",
		theme = {
			normal = { c = { fg = colors.fg, bg = colors.bg } },
			inactive = { c = { fg = colors.fg, bg = colors.bg } },
		},
	},
	sections = {
		-- these are to remove the defaults
		lualine_a = {},
		lualine_b = {},
		lualine_y = {},
		lualine_z = {},
		-- These will be filled later
		lualine_c = {},
		lualine_x = {},
	},
	inactive_sections = {
		-- these are to remove the defaults
		lualine_a = {},
		lualine_b = {},
		lualine_y = {},
		lualine_z = {},
		lualine_c = {},
		lualine_x = {},
	},
}

-- Inserts a component in lualine_c at left section
local function ins_left(component)
	table.insert(config.sections.lualine_c, component)
end

-- Inserts a component in lualine_x at right section
local function ins_right(component)
	table.insert(config.sections.lualine_x, component)
end

ins_left({
	-- mode component
	function()
		local mode_names = {
			n = "􀬑  NORMAL",
			i = "􀅫  INSERT",
			v = "􀑠  VISUAL",
			[""] = "􀑠  V-BLOCK",
			V = "􂬁  V-LINE",
			c = "􀆔 COMMAND",
			no = "OPERATOR",
			s = "SELECT",
			S = "S-LINE",
			[""] = "S-BLOCK",
			ic = "ITALIC",
			R = "􀈏  REPLACE",
			Rv = "􀈏  V-REPLACE",
			cv = "COMMAND",
			ce = "NORMAL",
			r = "PROMPT",
			rm = "MORE",
			["r?"] = "CONFIRM",
			["!"] = "􀩼  SHELL",
			t = "􀩼  TERMINAL",
		}
		return mode_names[vim.fn.mode()] or ""
	end,
	color = function()
		-- auto change color according to neovims mode
		local mode_color = {
			n = colors.yellow,
			i = colors.green,
			v = colors.blue,
			V = colors.blue,
			c = colors.magenta,
			no = colors.red,
			s = colors.orange,
			S = colors.orange,
			[""] = colors.orange,
			ic = colors.yellow,
			R = colors.purple,
			Rv = colors.purple,
			cv = colors.red,
			ce = colors.red,
			r = colors.cyan,
			rm = colors.cyan,
			["r?"] = colors.cyan,
			["!"] = colors.red,
			t = colors.red,
		}
		return { fg = colors.bg, bg = mode_color[vim.fn.mode()], gui = "bold" }
	end,
	padding = { left = 1, right = 1 },
})

ins_left({ "location" })

ins_left({ "progress", color = { fg = colors.fg, gui = "bold" } })

ins_left({
	"branch",
	icon = "",
	color = { fg = colors.green, gui = "bold" },
})

ins_left({
	"diff",
	symbols = { added = "􀑍 ", modified = "􁚛 ", removed = "􀃞 " },
	diff_color = {
		added = { fg = colors.green },
		modified = { fg = colors.yellow },
		removed = { fg = colors.red },
	},
	cond = conditions.hide_in_width,
})

ins_left({
	require("noice").api.statusline.mode.get,
	cond = require("noice").api.statusline.mode.has,
	color = { fg = colors.orange },
})

ins_right({
	-- filesize component
	"filesize",
	icon = "􀎾 ",
	cond = conditions.buffer_not_empty,
})

ins_right({
	"filename",
	icon = "􀈿 ",
	cond = conditions.buffer_not_empty,
	color = { fg = colors.magenta, gui = "bold" },
})

ins_right({
	"diagnostics",
	sources = { "nvim_diagnostic" },
	symbols = { error = "􀻀 ", warn = "􀘰 ", info = "􀅵 " },
	diagnostics_color = {
		color_error = { fg = colors.red },
		color_warn = { fg = colors.orange },
		color_info = { fg = colors.cyan },
	},
})

-- Insert mid section. You can make any number of sections in neovim :)
-- for lualine it's any number greater then 2
ins_right({
	-- Lsp server name .
	function()
		local msg = "No Active Lsp"
		local buf_ft = vim.api.nvim_buf_get_option(0, "filetype")
		local clients = vim.lsp.get_clients()
		if next(clients) == nil then
			return msg
		end
		for _, client in ipairs(clients) do
			local filetypes = client.config.filetypes
			if filetypes and vim.fn.index(filetypes, buf_ft) ~= -1 then
				return client.name
			end
		end
		return msg
	end,
	icon = "􀱢  LSP:",
	color = { fg = colors.purple, gui = "bold" },
})

require("lualine").setup(config)
-- require("lualine").setup({})

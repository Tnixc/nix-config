require("material").setup({

	contrast = {
		terminal = true, -- Enable contrast for the built-in terminal
		sidebars = true, -- Enable contrast for sidebar-like windows ( for example Nvim-Tree )
		floating_windows = true, -- Enable contrast for floating windows
		cursor_line = false, -- Enable darker background for the cursor line
		lsp_virtual_text = true, -- Enable contrasted background for lsp virtual text
		non_current_windows = true, -- Enable contrasted background for non-current windows
		filetypes = {}, -- Specify which filetypes get the contrasted (darker) background
	},

	styles = { -- Give comments style such as bold, italic, underline etc.
		comments = { --[[ italic = true ]]
		},
		strings = { --[[ bold = true ]]
		},
		keywords = { --[[ underline = true ]]
		},
		functions = { --[[ bold = true, undercurl = true ]]
		},
		variables = {},
		operators = {},
		types = {},
	},

	plugins = { -- Uncomment the plugins that you use to highlight them
		-- Available plugins:
		"gitsigns",
		"neogit",
		"noice",
		"nvim-cmp",
		"nvim-navic",
		"nvim-tree",
		"nvim-web-devicons",
		"rainbow-delimiters",
		"telescope",
		"trouble",
		"which-key",
		"nvim-notify",
	},

	disable = {
		colored_cursor = false, -- Disable the colored cursor
		borders = false, -- Disable borders between vertically split windows
		background = false, -- Prevent the theme from setting the background (NeoVim then uses your terminal background)
		term_colors = false, -- Prevent the theme from setting terminal colors
		eob_lines = false, -- Hide the end-of-buffer lines
	},

	high_visibility = {
		lighter = false, -- Enable higher contrast text for lighter style
		darker = false, -- Enable higher contrast text for darker style
	},

	lualine_style = "stealth", -- Lualine style ( can be 'stealth' or 'default' )

	async_loading = true, -- Load parts of the theme asynchronously for faster startup (turned on by default)

	custom_colors = nil, -- If you want to override the default colors, set this to a function

	custom_highlights = {}, -- Overwrite highlights with your own
})
vim.g.material_style = "deep ocean"
vim.cmd("colorscheme material")

vim.cmd("hi FloatBorder guifg=#0F111A")
vim.cmd("hi NormalFloat guibg=#0F111A")

-- cmp completions menu
vim.cmd("hi CmpItemAbbrDeprecated guifg=#3E4450")
vim.cmd("hi CmpItemAbbr guifg=#ADB6DE")
vim.cmd("hi CmpItemAbbrMatchFuzzy guifg=#FCCF67")
vim.cmd("hi CmpItemAbbrMatch guifg=#ADB6DE")
vim.cmd("hi CmpItemKindClass guifg=#E89982")
vim.cmd("hi CmpItemKindColor guifg=#84A0C6")
vim.cmd("hi CmpItemKindConstant guifg=#FF6666")
vim.cmd("hi CmpItemKindConstructor guifg=#5FB0FC")
vim.cmd("hi CmpItemKindEnum guifg=#54CED6")
vim.cmd("hi CmpItemKindEnumMember guifg=#C297B9")
vim.cmd("hi CmpItemKindEvent guifg=#7AAFF3")
vim.cmd("hi CmpItemKindField guifg=#FFE69F")
vim.cmd("hi CmpItemKindFile guifg=#FCCF67")
vim.cmd("hi CmpItemKindFolder guifg=#FCCF67")
vim.cmd("hi CmpItemKindFunction guifg=#BE8FD7")
vim.cmd("hi CmpItemKind guifg=#3E4450")
vim.cmd("hi CmpItemKindInterface guifg=#C397D8")
vim.cmd("hi CmpItemKindKeyword guifg=#66B3FF")
vim.cmd("hi CmpItemKindMethod guifg=#DC7272")
vim.cmd("hi CmpItemKindModule guifg=#5FB0FC")
vim.cmd("hi CmpItemKindOperator guifg=#70C0BA")
vim.cmd("hi CmpItemKindProperty guifg=#54CED6")
vim.cmd("hi CmpItemKindReference guifg=#FB7373")
vim.cmd("hi CmpItemKindSnippet guifg=#FFE59E")
vim.cmd("hi CmpItemKindStruct guifg=#5FB0FC")
vim.cmd("hi CmpItemKindText guifg=#5FB0FC")
vim.cmd("hi CmpItemKindTypeParameter guifg=#FFE49D")
vim.cmd("hi CmpItemKindUnit guifg=#54CED6")
vim.cmd("hi CmpItemKindValue guifg=#79DCAA")
vim.cmd("hi CmpItemKindVariable guifg=#36C692")
vim.cmd("hi CmpItemMenu guifg=#6791C9")

vim.cmd("hi Pmenu guibg=#151519 guifg=#585859")
vim.cmd("hi PmenuSbar guibg=#151519 guifg=#585859")
vim.cmd("hi PmenuSel guibg=#29292D")
vim.cmd("hi PmenuThumb guibg=#151519")

-- Telescope highlighting
vim.cmd("highlight TelescopeMatching gui=bold guifg=#E6CFA1")

vim.cmd("highlight TelescopePreviewBorder guibg=#08090E guifg=#08090E")
vim.cmd("highlight TelescopePreviewLine guibg=#27272C")
vim.cmd("highlight TelescopePreviewNormal guibg=#08090E guifg=#BABABE")
vim.cmd("highlight TelescopePreviewTitle guibg=#6791C9 guifg=#101317")

-- Telescope Prompt
vim.cmd("highlight TelescopePromptBorder guibg=#1F2233 guifg=#1F2233")
vim.cmd("highlight TelescopePromptCounter guibg=#1F2233 gui=bold guifg=#E6CFA1")
vim.cmd("highlight telescopepromptnormal guibg=#1F2233 guifg=#bababe")
vim.cmd("highlight TelescopePromptPrefix guibg=#1F2233 guifg=#6791C9")
vim.cmd("highlight TelescopePromptTitle guibg=#E89982 guifg=#101317")

vim.cmd("highlight TelescopeResultsBorder guibg=#08090E guifg=#08090E")
vim.cmd("highlight TelescopeResultsNormal guibg=#08090E guifg=#BABABE")
vim.cmd("highlight TelescopeResultsTitle guibg=#78B892 guifg=#101317")

vim.cmd("highlight TelescopeSelectionCaret guibg=#27272C guifg=#E89982")
vim.cmd("highlight TelescopeSelection guibg=#1F2233 guifg=#6791C9")

-- Line Numbers
vim.cmd("hi CursorColumn guibg=#101317")
vim.cmd("hi CursorLineFold guibg=#101317 guifg=#70C0BA")
vim.cmd("hi CursorLine guibg=none")
vim.cmd("hi CursorLineNr gui=bold guifg=#FFBE91")
vim.cmd("hi CursorLineSign guibg=none")

vim.cmd("hi Cursor guibg=#FFBE91 guifg=#101317")

-- Neo Tree Higlights
vim.cmd("hi NvimTreeDirectoryIcon guifg=#BDCBD6")
vim.cmd("hi NvimTreeNormalNC guibg=#111214")
vim.cmd("hi NvimTreeNormal guibg=#161719")
vim.cmd("hi NvimTreeFloatTitle guibg=#84A0C6")
vim.cmd("hi NvimTreeOpenedFolderName guifg=#6791C9")

-- Monark Highlighting
vim.cmd("hi monarkVisual guifg=#6791C9")
vim.cmd("hi monarkInsert guifg=#78B892")
vim.cmd("hi monarkNormal guifg=#E89982")

-- Rnvimr Highlighting
vim.cmd("hi RnvimrNormal guibg=#08090E guifg=#BDCBD6")

-- Notify
vim.cmd("hi NotifyBackground guibg=#08090E guifg=#FFFFFF")

vim.cmd("hi NotifyDEBUGBody guibg=#08090E guifg=#C397D8")
vim.cmd("hi NotifyDEBUGBorder guibg=#08090E guifg=#08090E")
vim.cmd("hi NotifyDEBUGIcon guibg=#08090E guifg=#B77EE0")
vim.cmd("hi NotifyDEBUGTitle guibg=#08090E guifg=#C397D8")
vim.cmd("hi NotifyERRORBody guibg=#08090E guifg=#F87070")
vim.cmd("hi NotifyERRORBorder guibg=#08090E guifg=#08090E")
vim.cmd("hi NotifyERRORIcon guibg=#08090E guifg=#FB7373")
vim.cmd("hi NotifyERRORTitle guibg=#08090E guifg=#F87070")
vim.cmd("hi NotifyINFOBody guibg=#08090E guifg=#82AAFF")
vim.cmd("hi NotifyINFOBorder guibg=#08090E guifg=#08090E")
vim.cmd("hi NotifyINFOIcon guibg=#08090E guifg=#5FB0FC")
vim.cmd("hi NotifyINFOTitle guibg=#08090E guifg=#82AAFF")

vim.cmd("hi NotifyLogTime guifg=#515C68")
vim.cmd("hi NotifyLogTitle guifg=#FB7373")

vim.cmd("hi NotifyTRACEBody guibg=#08090E guifg=#79DCAA")
vim.cmd("hi NotifyTRACEBorder guibg=#08090E guifg=#08090E")
vim.cmd("hi NotifyTRACEIcon guibg=#08090E guifg=#36C692")
vim.cmd("hi NotifyTRACETitle guibg=#08090E guifg=#79DCAA")

vim.cmd("hi NotifyWARNBody guibg=#08090E guifg=#FFE59E")
vim.cmd("hi NotifyWARNBorder guibg=#08090E guifg=#08090E")
vim.cmd("hi NotifyWARNIcon guibg=#08090E guifg=#FCCF67")
vim.cmd("hi NotifyWARNTitle guibg=#08090E guifg=#FFE59E")

-- Indent Blank Line
vim.cmd("hi IndentBlanklineChar guifg=#22272C")
vim.cmd("hi IndentBlanklineContextChar guifg=#7AB0DF")
vim.cmd("hi IndentBlanklineContextStart guibg=#16191F")

-- Barbeque
vim.cmd("hi barbecue_normal guibg=#090B0F")

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = vim.tbl_deep_extend("force", capabilities, require("cmp_nvim_lsp").default_capabilities())

-- ensure installed:
local servers = {}
require("mason").setup()
local ensure_installed = vim.tbl_keys(servers or {})
require("mason-tool-installer").setup({ ensure_installed = ensure_installed })
vim.g.zig_fmt_parse_errors = 0

-- LSP handlers with border
local handlers = {
	["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, { header = "", border = Border("BGFloatBorder") }),
	["textDocument/signatureHelp"] = vim.lsp.with(
		vim.lsp.handlers.signature_help,
		{ header = "", border = Border("BGFloatBorder") }
	),
}

-- Override floating preview globally
local orig_util_open_floating_preview = vim.lsp.util.open_floating_preview
function vim.lsp.util.open_floating_preview(contents, syntax, opts, ...)
	opts = opts or {}
	opts.border = opts.border or Border("BGFloatBorder")
	opts.header = ""
	return orig_util_open_floating_preview(contents, syntax, opts, ...)
end

require("mason-lspconfig").setup({
	handlers = {
		function(server_name)
			local server = servers[server_name] or {}
			server.capabilities = vim.tbl_deep_extend("force", {}, capabilities, server.capabilities or {})
			server.handlers = handlers -- Apply handlers to all servers
			require("lspconfig")[server_name].setup(server)
		end,
	},
})

local signs = {
	ERROR = "  ",
	WARN = "  ",
	HINT = " 󰌵 ",
	INFO = "  ",
}

vim.fn.sign_define("DiagnosticSignError", { text = "󰘍", texthl = "DiagnosticSignError" })
vim.fn.sign_define("DiagnosticSignWarn", { text = "󰘍", texthl = "DiagnosticSignWarn" })
vim.fn.sign_define("DiagnosticSignInfo", { text = "󰘍", texthl = "DiagnosticSignInfo" })
vim.fn.sign_define("DiagnosticSignHint", { text = "󰘍", texthl = "DiagnosticSignHint" })

vim.diagnostic.config({
	virtual_text = {
		prefix = function(diagnostic)
			return signs[vim.diagnostic.severity[diagnostic.severity]]
		end,
	},
})

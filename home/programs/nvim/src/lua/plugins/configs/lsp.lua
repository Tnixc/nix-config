---
-- LSP configuration
---
local lspconfig = require("lspconfig")

lspconfig.astro.setup({})
lspconfig.cssls.setup({})
lspconfig.tailwindcss.setup({})
lspconfig.gopls.setup({})
lspconfig.gradle_ls.setup({})
lspconfig.html.setup({})
lspconfig.java_language_server.setup({})
lspconfig.biome.setup({})
lspconfig.tsserver.setup({})
lspconfig.jsonls.setup({})
lspconfig.lua_ls.setup({})
lspconfig.nil_ls.setup({})
lspconfig.pyright.setup({})
lspconfig.rust_analyzer.setup({})
lspconfig.svelte.setup({})
lspconfig.volar.setup({})
lspconfig.zls.setup({})

-- Add cmp_nvim_lsp capabilities settings to lspconfig
lspconfig.util.default_config.capabilities = vim.tbl_deep_extend(
	"force",
	lspconfig.util.default_config.capabilities,
	require("cmp_nvim_lsp").default_capabilities()
)

---
-- Autocompletion setup
---
local cmp = require("cmp")

cmp.setup({
	sources = {
		{ name = "nvim_lsp" },
	},
	snippet = {
		expand = function(args)
			-- You need Neovim v0.10 to use vim.snippet
			vim.snippet.expand(args.body)
		end,
	},
	mapping = cmp.mapping.preset.insert({}),
})

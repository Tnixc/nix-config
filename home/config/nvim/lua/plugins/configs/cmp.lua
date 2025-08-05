local cmp = require("cmp")
local luasnip = require("luasnip")

cmp.setup({
  sources = {
    { name = "nvim_lsp" },
    { name = "lazydev", group_index = 0 },
    { name = "luasnip" },
    { name = "path" },
  },
  snippet = {
    expand = function(args)
      luasnip.lsp_expand(args.body)
    end,
  },
  mapping = cmp.mapping.preset.insert({
    ["<Tab>"] = cmp.mapping.confirm({ select = true }),
    ["<C-j>"] = cmp.mapping.select_next_item(),
    ["<C-k>"] = cmp.mapping.select_prev_item(),
  }),
  formatting = {
    mode = "symbol",
    fields = { "abbr", "kind", "menu" },
    format = function(entry, item)
      local color_item = require("nvim-highlight-colors").format(entry, { kind = item.kind })
      item = require("lspkind").cmp_format({ mode = "symbol" })(entry, item)
      if color_item.abbr_hl_group then
        item.kind_hl_group = color_item.abbr_hl_group
        item.kind = color_item.abbr
      end
      item.menu = ({
        buffer = "[Buf]",
        path = "[Path]",
        nvim_lsp = "[LSP]",
        luasnip = "[Snip]",
        cmdline = "[Cmd]",
        nvim_lua = "[Lua]",
      })[entry.source.name]
      return item
    end,
    expandable_indicator = true,
  },
  window = {
    completion = {
      border = Border("FloatBorder"),
      winhighlight = "Normal:Normal,CursorLine:Visual,Search:None",
    },
    documentation = {
      border = Border("FloatBorder"),
      winhighlight = "Normal:Normal,CursorLine:Visual,Search:None",
    },
  },
})

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
        fields = { "kind", "abbr" },
        format = function(entry, item)
            local color_item = require("nvim-highlight-colors").format(entry, { kind = item.kind })
            local kind = require("lspkind").cmp_format({ mode = "symbol_text", maxwidth = 50 })(entry, item)
            local strings = vim.split(kind.kind, "%s", { trimempty = true })

            if color_item.abbr_hl_group then
                local hl_group = "CmpItemKindColor" .. color_item.abbr_hl_group
                if vim.fn.hlexists(hl_group) == 0 then
                    local hl = vim.api.nvim_get_hl(0, { name = color_item.abbr_hl_group, link = false })
                    if hl.fg then
                        vim.api.nvim_set_hl(0, hl_group, { fg = crust, bg = hl.fg })
                    end
                end
                item.kind_hl_group = hl_group
                item.kind = " " .. (strings[1] or "󰏘") .. " "
            else
                item.kind = " " .. (strings[1] or "") .. " "
            end
            item.menu = ""

            return item
        end,
    },
    window = {
        completion = {
            winhighlight = "Normal:CmpNormal,FloatBorder:CmpNormal,Search:None,CursorLine:CmpSel",
            col_offset = -3,
            side_padding = 0,
        },
        documentation = {
            border = Border("CrustBorder"),
            winhighlight = "Normal:DocNormal",
        },
    },
})

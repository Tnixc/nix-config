local kind_icons = {
    Array = "  ",
    Boolean = "  ",
    Class = "  ",
    Color = "  ",
    Constant = "  ",
    Constructor = "  ",
    Enum = "  ",
    EnumMember = "  ",
    Event = "  ",
    Field = "  ",
    File = "  ",
    Folder = " 󰉋 ",
    Function = "  ",
    Interface = "  ",
    Key = "  ",
    Keyword = "  ",
    Method = "  ",
    Module = "  ",
    Namespace = "  ",
    Null = " 󰟢 ",
    Number = "  ",
    Object = "  ",
    Operator = "  ",
    Package = "  ",
    Property = "  ",
    Reference = "  ",
    Snippet = "  ",
    String = "  ",
    Struct = "  ",
    Text = "  ",
    TypeParameter = "  ",
    Unit = "  ",
    Value = "  ",
    Variable = "  ",
}

local cmp = require("cmp")
local luasnip = require("luasnip")
luasnip.config.setup({})

local function border(hl_name)
    return {
        { "┌", hl_name },
        { "─", hl_name },
        { "┐", hl_name },
        { "│", hl_name },
        { "┘", hl_name },
        { "─", hl_name },
        { "└", hl_name },
        { "│", hl_name },
    }
end

cmp.setup({
    window = {
        completion = {
            border = border("FloatBorder"),
            winhighlight = "Normal:Normal,CursorLine:Visual,Search:None",
        },
        documentation = {
            border = border("FloatBorder"),
            winhighlight = "Normal:Normal,CursorLine:Visual,Search:None",
        },
    },
    snippet = {
        expand = function(args)
            luasnip.lsp_expand(args.body)
        end,
    },
    completion = { completeopt = "menu,menuone,noinsert" },

    -- For an understanding of why these mappings were
    -- chosen, you will need to read `:help ins-completion`
    --
    -- No, but seriously. Please read `:help ins-completion`, it is really good!
    mapping = cmp.mapping.preset.insert({

        -- If you prefer more traditional completion keymaps,
        -- you can uncomment the following lines
        ["<Tab>"] = cmp.mapping.confirm({ select = true }),
        ["<C-j>"] = cmp.mapping.select_next_item(),
        ["<C-k>"] = cmp.mapping.select_prev_item(),
    }),
    sources = {
        {
            name = "lazydev",
            -- set group index to 0 to skip loading LuaLS completions as lazydev recommends it
            group_index = 0,
        },
        { name = "nvim_lsp" },
        { name = "luasnip" },
        { name = "path" },
    },
    formatting = {
        fields = { "abbr", "menu", "kind" },
        format = function(entry, vim_item)
            vim_item.kind = kind_icons[vim_item.kind]
            vim_item.menu = ({
                buffer = "[Buf]",
                path = "[Path]",
                nvim_lsp = "[Lsp]",
                luasnip = "[Snip]",
                cmdline = "[Cmd]",
                nvim_lua = "[Lua]",
            })[entry.source.name]
            return vim_item
        end,
    },
})

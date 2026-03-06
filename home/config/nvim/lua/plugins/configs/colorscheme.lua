COLORS = require("theme.colors")

require("catppuccin").setup({
    transparent_background = false,
    float = {
        transparent = false,
        solid = true,
    },
    auto_integrations = false,
    color_overrides = {
        all = COLORS,
    },
    custom_highlights = function(colors)
        return {
            MantleBorder = { fg = colors.mantle, bg = colors.mantle },
            BaseBorder = { fg = colors.base, bg = colors.base },
            CrustBorder = { fg = colors.crust, bg = colors.crust },
            Folded = { fg = colors.sapphire, bg = colors.mantle },
            UfoFoldedBg = { bg = colors.surface0 },
            CmpNormal = { bg = colors.base },
            DocNormal = { bg = colors.crust },

            SnacksPickerNormal = { bg = colors.crust },
            SnacksPickerBorder = { fg = colors.surface0, bg = colors.surface0 },
            SnacksPickerTitle = { fg = colors.crust, bg = colors.green },
            SnacksPickerInput = { bg = colors.surface0 },
            SnacksPickerInputBorder = { fg = colors.surface0, bg = colors.surface0 },
            SnacksPickerList = { bg = colors.base },
            SnacksPickerListTitle = { bg = colors.teal, fg = colors.crust },
            SnacksPickerListBorder = { fg = colors.base, bg = colors.base },
            SnacksPickerPreview = { bg = colors.mantle },
            SnacksPickerPreviewBorder = { fg = colors.mantle, bg = colors.mantle },

            SnacksDashboardFile = { fg = colors.blue },
            SnacksDashboardHeader = { fg = colors.blue },
            SnacksDashboardIcon = { fg = colors.blue },
            SnacksDashboardFooter = { fg = colors.mauve },
            SnacksDashboardSpecial = { fg = colors.blue },
            SnacksDashboardTitle = { fg = colors.mauve, bold = true },
            SnacksDashboardKey = { fg = colors.sapphire },

            PmenuSel = { bg = colors.surface1, fg = colors.text },
            Pmenu = { fg = colors.text, bg = colors.mantle },

            CmpSel = { bg = colors.lavender, fg = colors.crust },

            -- Treesitter comment highlights
            ["@comment.todo"] = { fg = colors.blue, bg = colors.surface0, bold = true },
            ["@comment.note"] = { fg = colors.teal, bg = colors.surface0, bold = true },
            ["@comment.fixme"] = { fg = colors.red, bg = colors.surface0, bold = true },
            ["@comment.warning"] = { fg = colors.yellow, bg = colors.surface0, bold = true },

            -- Prevent LSP semantic tokens from overriding comment highlights
            ["@lsp.type.comment"] = {},
        }
    end,
})

vim.cmd("colorscheme catppuccin-macchiato")

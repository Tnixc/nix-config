require("catppuccin").setup({
    transparent_background = true,
    float = {
        transparent = false,
        solid = true,
    },
    auto_integrations = true,
    color_overrides = {
        macchiato = {
            rosewater = "#de9d9d",
            flamingo = "#dea89d",
            pink = "#b294bb",
            mauve = "#9d8bb8",
            red = "#cc6666",
            maroon = "#c67d7d",
            peach = "#de935f",
            yellow = "#f0c674",
            green = "#b5bd68",
            teal = "#8abeb7",
            sky = "#95b3c9",
            sapphire = "#7ea9b8",
            blue = "#81a2be",
            lavender = "#9db5c9",
            text = "#c5c8c6",
            subtext1 = "#a8aba9",
            subtext0 = "#8b8d8b",
            overlay2 = "#6f7271",
            overlay1 = "#5a5c5b",
            overlay0 = "#4d5057",
            surface2 = "#3a3c3f",
            surface1 = "#373b41",
            surface0 = "#282a2e",
            base = "#1d1f21",
            mantle = "#161719",
            crust = "#0f1011",
        },
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

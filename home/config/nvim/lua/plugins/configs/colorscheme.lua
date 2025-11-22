require("catppuccin").setup({
    transparent_background = true,
    float = {
        transparent = false,
        solid = true,
    },
    auto_integrations = true,
    color_overrides = {
        macchiato = {
            rosewater = "#C97D6E",
            flamingo = "#C98A7D",
            pink = "#BC76C1",
            mauve = "#6872AB",
            red = "#CB7676",
            maroon = "#CC8D82",
            peach = "#CC8D70",
            yellow = "#CC9B70",
            green = "#80A665",
            teal = "#5EA994",
            sky = "#6394BF",
            sapphire = "#5D9AA9",
            blue = "#687eaa",
            lavender = "#4C8E72",
            text = "#D8D6C9",
            subtext1 = "#B2B0A6",
            subtext0 = "#999895",
            overlay2 = "#7F7F7C",
            overlay1 = "#666666",
            overlay0 = "#4C4C4C",
            surface2 = "#333333",
            surface1 = "#232323",
            surface0 = "#1E1E1E",
            base = "#121212",
            mantle = "#0A0A0A",
            crust = "#000000",
        },
    },
    custom_highlights = function(colors)
        return {
            MantleBorder = { fg = colors.surface2, bg = colors.mantle },
            BaseBorder = { fg = colors.surface2, bg = colors.base },
            CrustBorder = { fg = colors.surface2, bg = colors.crust },
            MultiCursor = { fg = colors.maroon, bg = colors.crust },
            MultiCursorMain = { fg = colors.red, bg = colors.crust },
            Folded = { fg = colors.sapphire, bg = colors.mantle },
            UfoFoldedBg = { bg = colors.surface0 },
            CmpNormal = { bg = colors.base },
            DocNormal = { bg = colors.crust },

            SnacksPickerNormal = { bg = colors.crust },
            SnacksPickerTitle = { fg = colors.crust, bg = colors.green },
            SnacksPickerPreview = { bg = colors.crust },

            PmenuSel = { bg = colors.surface1, fg = colors.text },
            Pmenu = { fg = colors.text, bg = colors.mantle },

            CmpSel = { bg = colors.lavender, fg = colors.crust },
        }
    end,
})

vim.cmd("colorscheme catppuccin-macchiato")

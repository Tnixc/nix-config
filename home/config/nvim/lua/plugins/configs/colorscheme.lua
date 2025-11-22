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

            TelescopeNormal = { bg = colors.crust },
            TelescopeResultsTitle = { fg = colors.crust, bg = colors.red },
            TelescopePreviewTitle = { fg = colors.crust, bg = colors.sapphire },
            TelescopePromptTitle = { fg = colors.crust, bg = colors.green },

            PmenuSel = { bg = colors.surface1, fg = colors.text },
            Pmenu = { fg = colors.text, bg = colors.mantle },

            CmpItemAbbrDeprecated = { fg = colors.overlay1, bg = "NONE", strikethrough = true },
            CmpItemAbbrMatch = { fg = colors.blue, bg = "NONE", bold = true },
            CmpItemAbbrMatchFuzzy = { fg = colors.blue, bg = "NONE", bold = true },
            CmpItemMenu = { fg = colors.pink, bg = "NONE", italic = true },

            CmpSel = { bg = colors.teal, fg = colors.crust },

            CmpItemKindField = { fg = colors.crust, bg = colors.red },
            CmpItemKindProperty = { fg = colors.crust, bg = colors.red },
            CmpItemKindEvent = { fg = colors.crust, bg = colors.red },

            CmpItemKindText = { fg = colors.crust, bg = colors.green },
            CmpItemKindEnum = { fg = colors.crust, bg = colors.green },
            CmpItemKindKeyword = { fg = colors.crust, bg = colors.green },

            CmpItemKindConstant = { fg = colors.crust, bg = colors.yellow },
            CmpItemKindConstructor = { fg = colors.crust, bg = colors.yellow },
            CmpItemKindReference = { fg = colors.crust, bg = colors.yellow },

            CmpItemKindFunction = { fg = colors.crust, bg = colors.pink },
            CmpItemKindStruct = { fg = colors.crust, bg = colors.pink },
            CmpItemKindClass = { fg = colors.crust, bg = colors.pink },
            CmpItemKindModule = { fg = colors.crust, bg = colors.pink },
            CmpItemKindOperator = { fg = colors.crust, bg = colors.pink },

            CmpItemKindVariable = { fg = colors.crust, bg = colors.overlay1 },
            CmpItemKindFile = { fg = colors.crust, bg = colors.overlay1 },

            CmpItemKindUnit = { fg = colors.crust, bg = colors.peach },
            CmpItemKindSnippet = { fg = colors.crust, bg = colors.peach },
            CmpItemKindFolder = { fg = colors.crust, bg = colors.peach },

            CmpItemKindMethod = { fg = colors.crust, bg = colors.blue },
            CmpItemKindValue = { fg = colors.crust, bg = colors.blue },
            CmpItemKindEnumMember = { fg = colors.crust, bg = colors.blue },

            CmpItemKindInterface = { fg = colors.crust, bg = colors.teal },
            CmpItemKindColor = { fg = colors.crust, bg = colors.teal },
            CmpItemKindTypeParameter = { fg = colors.crust, bg = colors.teal },
        }
    end,
})

vim.cmd("colorscheme catppuccin-macchiato")

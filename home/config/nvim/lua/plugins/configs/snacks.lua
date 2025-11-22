require("snacks").setup({
    picker = {
        prompt = " 􀊫  ",
        ui_select = true,
        layout = {
            preset = function()
                return vim.o.columns >= 120 and "default" or "vertical"
            end,
        },
        win = {
            input = {
                keys = {
                    ["<C-j>"] = { "list_down", mode = { "i", "n" } },
                    ["<C-k>"] = { "list_up", mode = { "i", "n" } },
                    ["<C-q>"] = { "qflist", mode = { "i", "n" } },
                    ["<Esc>"] = { "close", mode = { "n", "i" } },
                },
                wo = {
                    winhighlight = "Normal:SnacksPickerInput,FloatBorder:SnacksPickerInputBorder",
                },
            },
            list = {
                wo = {
                    winhighlight = "Normal:SnacksPickerList,FloatBorder:SnacksPickerListBorder",
                },
            },
            preview = {
                wo = {
                    wrap = false,
                    winhighlight = "Normal:SnacksPickerPreview,FloatBorder:SnacksPickerPreviewBorder",
                },
            },
        },
        sources = {
            explorer = {
                auto_close = true,
                layout = {
                    layout = {
                        position = "right",
                        width = 45,
                    },
                },
            },
        },
    },
    grep = {
        finder = "rg",
        format = "file",
        live = true,
        buffers = true,
        need_search = false,
        supports_live = true,
    },
    explorer = {
        replace_netrw = true,
    },
    lazygit = {
        configure = false,
    },

    scroll = {
        animate = {
            duration = { step = 10, total = 300 },
            easing = "outQuad",
        },
    },
})

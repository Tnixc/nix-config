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
    explorer = {},
    lazygit = {
        configure = false,
    },
})

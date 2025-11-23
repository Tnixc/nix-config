require("snacks").setup({
    dashboard = {
        width = 60,
        pane_gap = 4,
        preset = {
            header = [[ 




            ]],
            keys = {
                { icon = "􀊫", key = "f", desc = "Find File", action = ":lua Snacks.dashboard.pick('files')" },
                { icon = "􀑍", key = "n", desc = "New File", action = ":ene | startinsert" },
                { icon = "􀕹", key = "g", desc = "Find Text", action = ":lua Snacks.dashboard.pick('live_grep')" },
                { icon = "􀣔", key = "r", desc = "Recent Files", action = ":lua Snacks.dashboard.pick('oldfiles')" },
                { icon = "􀧏", key = "s", desc = "Restore Session", section = "session" },
                { icon = "􀖃", key = "L", desc = "Lazy", action = ":Lazy", enabled = package.loaded.lazy ~= nil },
                { icon = "􀆄", key = "q", desc = "Quit", action = ":qa" },
            },
        },
        sections = {
            {
                pane = 2,
                section = "terminal",
                cmd = "chafa /Users/tnixc/Pictures/assets/Z2.PNG --format symbols --symbols vhalf --size 100x6 --stretch -t 1",
                height = 6,
                padding = 2,
                indent = -52,
            },
            { section = "header", pane = 1 },
            { section = "keys", gap = 1, padding = 1 },
            { pane = 2, icon = "􀣔", title = "Recent Files", section = "recent_files", indent = 2, padding = 1 },
            { pane = 2, icon = "􀙅", title = "Projects", section = "projects", indent = 2, padding = 1 },
            { section = "startup", indent = 60, padding = 5, pane = 1, icon = "􀋥  " },
        },
    },
    terminal = {
        shell = "fish",
        win = {
            style = "terminal",
            position = "float",
            border = "single",
            width = 0.8,
            height = 0.8,
            title = " Terminal ",
            title_pos = "center",
            on_win = function(win)
                vim.api.nvim_create_autocmd("WinLeave", {
                    buffer = win.buf,
                    callback = function()
                        win:hide()
                    end,
                })
            end,
            wo = {
                winhighlight = "FloatBorder:MantleBorder",
            },
            keys = {
                ["<M-l>"] = { "hide", mode = { "n", "t", "i" } },
            },
        },
    },
    picker = {
        prompt = " 􀊫  ",
        ui_select = true,
        layout = {
            reverse = false,
            layout = {
                box = "horizontal",
                backdrop = false,
                width = 0.9,
                height = 0.9,
                border = "none",
                {
                    box = "vertical",
                    {
                        win = "input",
                        height = 1,
                        border = true,
                        title = "{title} {live} {flags}",
                        title_pos = "center",
                    },
                    { win = "list", title = " Results ", title_pos = "center", border = true },
                },
                {
                    win = "preview",
                    title = "{preview:Preview}",
                    width = 0.5,
                    border = true,
                    title_pos = "center",
                },
            },
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

-- NOTE: Keymaps here
local wk = require("which-key")

vim.api.nvim_create_user_command("Format", function(args)
    local range = nil
    if args.count ~= -1 then
        local end_line = vim.api.nvim_buf_get_lines(0, args.line2 - 1, args.line2, true)[1]
        range = {
            start = { args.line1, 0 },
            ["end"] = { args.line2, end_line:len() },
        }
    end
    require("conform").format({ async = true, lsp_format = "fallback", range = range })
end, { range = true })

local function toggle_diffview()
    local diffview_open = false
    for _, win in ipairs(vim.api.nvim_list_wins()) do
        local buf = vim.api.nvim_win_get_buf(win)
        local buf_name = vim.api.nvim_buf_get_name(buf)
        if buf_name:match("Diffview") then
            diffview_open = true
            break
        end
    end

    if diffview_open then
        vim.cmd("DiffviewClose")
    else
        vim.cmd("DiffviewOpen")
    end
end

wk.add({
    -- Normal mode mappings
    {
        mode = "n",
        -- Window navigation
        { "<C-h>", "<C-w>h", desc = "Move to left window" },
        { "<C-j>", "<C-w>j", desc = "Move to bottom window" },
        { "<C-k>", "<C-w>k", desc = "Move to top window" },
        { "<C-l>", "<C-w>l", desc = "Move to right window" },

        -- Window resizing
        { "<c-up>", "<cmd>resize -2<cr>", desc = "decrease window height" },
        { "<c-down>", "<cmd>resize +2<cr>", desc = "increase window height" },
        { "<c-left>", "<cmd>vertical resize -2<cr>", desc = "decrease window width" },
        { "<c-right>", "<cmd>vertical resize +2<cr>", desc = "increase window width" },

        -- leader mappings
        {
            "<leader>h",
            "<cmd>nohlsearch<cr>",
            desc = "Clear Search Highlights",
            icon = { icon = "", color = "orange" },
        },

        {
            "<leader>a",
            function()
                for _, win in ipairs(vim.api.nvim_list_wins()) do
                    local buf = vim.api.nvim_win_get_buf(win)
                    if vim.bo[buf].filetype == "snacks_dashboard" then
                        vim.cmd("q")
                        return
                    end
                end
                Snacks.dashboard()
            end,
            desc = "Toggle Dashboard",
            icon = { icon = "󰕮", color = "purple" },
        },
        {
            "<leader>e",
            function()
                Snacks.explorer()
            end,
            desc = "Toggle Explorer",
            icon = { icon = "", color = "azure" },
        },
        { "<leader>w", "<cmd>w<cr>", desc = "Save File", icon = { icon = "󰆓", color = "green" } },
        { "<leader>q", "<cmd>q<cr>", desc = "Quit", icon = { icon = "󰈆", color = "yellow" } },
        { "<leader>Q", "<cmd>qa!<cr>", desc = "Quit All", icon = { icon = "", color = "red" } },
        -- file operations
        {
            group = "Find",
            { "<leader>f", desc = "Find" },
            {
                "<leader>f?",
                function()
                    Snacks.picker()
                end,
                desc = "Open picker",
                icon = { icon = "󱎸", color = "green" },
            },

            {
                "<leader>fg",
                function()
                    Snacks.picker.grep()
                end,
                desc = "Live grep",
                icon = { icon = "󱎸", color = "cyan" },
            },
            {
                "<leader>ff",
                function()
                    Snacks.picker.files()
                end,
                desc = "Find files",
                icon = { icon = "", color = "green" },
            },
            {
                "<leader>ft",
                function()
                    Snacks.picker.recent()
                end,
                desc = "Find history",
                icon = { icon = "", color = "blue" },
            },
            {
                "<leader>fd",
                function()
                    Snacks.picker.git_files()
                end,
                desc = "Find git files",
                icon = { icon = "", color = "orange" },
            },
            {
                "<leader>fo",
                function()
                    Snacks.picker.projects()
                end,
                desc = "Open project",
                icon = { icon = "", color = "red" },
            },
            {
                "<leader>f<Tab>",
                function()
                    Snacks.picker.buffers()
                end,
                desc = "Find buffers",
                icon = { icon = "󱦞", color = "yellow" },
            },
            {
                "<leader>fu",
                function()
                    Snacks.picker.undo()
                end,
                desc = "View undo history",
                icon = { icon = "", color = "orange" },
            },
            icon = { icon = "", color = "cyan" },
        },

        -- LSP operations
        {
            group = "LSP",
            { "<leader>l", desc = "LSP" },
            {
                "<leader>lq",
                "<cmd>lua vim.lsp.buf.code_action()<cr>",
                icon = { icon = "", color = "yellow" },
                desc = "Code actions",
            },

            {
                "<leader>ld",
                function()
                    Snacks.picker.lsp_symbols()
                end,
                desc = "Find document symbols",
                icon = { icon = "", color = "blue" },
            },
            {
                "<leader>li",
                function()
                    Snacks.picker.lsp_references()
                end,
                desc = "Find references",
                icon = { icon = "", color = "orange" },
            },
            {
                "<leader>lh",
                function()
                    Snacks.picker.lsp_workspace_symbols()
                end,
                desc = "Find workspace symbols",
                icon = { icon = "", color = "green" },
            },
            {
                "<leader>lr",
                "<cmd>lua vim.lsp.buf.rename()<cr>",
                desc = "Rename symbol",
                icon = { icon = "󰑕", color = "red" },
            },
            {
                "<leader>lf",
                "<cmd>Format<cr>",
                desc = "Format buffer",
                icon = { icon = "󰉶", color = "azure" },
            },
            icon = { icon = "󰮄", color = "yellow" },
        },
        -- Diagnostics
        {
            group = "Diagnostics",
            { "<leader>x", desc = "Diagnostics" },
            {
                "<leader>xx",
                "<cmd>Trouble diagnostics<cr>",
                desc = "Open Trouble diagnostics",
                icon = { icon = "", color = "red" },
            },
            {
                "<leader>xt",
                function()
                    Snacks.picker.diagnostics()
                end,
                desc = "Open picker diagnostics",
                icon = { icon = "", color = "cyan" },
            },
            {
                "<leader>xX",
                "<cmd>Trouble diagnostics toggle filter.buf=0<cr>",
                desc = "Trouble diagnostics for current buffer",
                icon = { icon = "", color = "orange" },
            },
            icon = { icon = "", color = "red" },
        },

        -- Git operations
        {
            group = "Git",
            { "<leader>j", desc = "Git" },
            {
                "<leader>jc",
                function()
                    Snacks.picker.git_log()
                end,
                desc = "Git commits",
                icon = { icon = "", color = "green" },
            },
            {
                "<leader>jb",
                function()
                    Snacks.picker.git_branches()
                end,
                desc = "Git branches",
            },
            {
                "<leader>jj",
                function()
                    Snacks.lazygit()
                end,
                desc = "Open LazyGit",
                icon = { icon = "", color = "purple" },
            },
            { "<leader>jv", toggle_diffview, desc = "Toggle Diffview", icon = { icon = "", color = "red" } },
            {
                "<leader>jg",
                "<cmd>Gitsigns preview_hunk<cr>",
                desc = "Preview hunk",
                icon = { icon = "", color = "azure" },
            },
            {
                "<leader>jo",
                "<cmd>Gitsigns next_hunk<cr>",
                desc = "next hunk",
                icon = { icon = "", color = "green" },
            },
            {
                "<leader>ji",
                "<cmd>Gitsigns prev_hunk<cr>",
                desc = "Previous hunk",
                icon = { icon = "", color = "red" },
            },
        },
        {
            group = "Go to",
            { "g", desc = "Go to" },
            { "gd", "<cmd>lua vim.lsp.buf.definition()<cr>", desc = "Go to definition" },
            { "gD", "<cmd>lua vim.lsp.buf.declaration()<cr>", desc = "Go to declaration" },
            { "gi", "<cmd>lua vim.lsp.buf.implementation()<cr>", desc = "Go to implementation" },
            { "gt", "<cmd>lua vim.lsp.buf.type_definition()<cr>", desc = "Go to type definition" },
            { "gr", "<cmd>lua vim.lsp.buf.references()<cr>", desc = "Go to references" },
            { "gs", "<cmd>lua vim.lsp.buf.signature_help()<cr>", desc = "Show signature help" },
        },

        -- Multicursor
        { "m", "<cmd>MCstart<cr>", desc = "Create multiple cursors (normal)" },

        -- Other
        { "<A-k>", "<cmd>m .-2<cr>", desc = "Move line up" },
        { "<A-j>", "<cmd>m .+1<cr>", desc = "Move line down" },
        {
            group = "Other",
            { "<leader>d", desc = "Other" },
            { "<leader>df", "<cmd>enew<cr>", desc = "New file", icon = { icon = "", color = "green" } },
            {
                "<leader>dc",
                "<cmd>HighlightColors Toggle<cr>",
                desc = "Toggle highlight colors",
                icon = { icon = "󰸱", color = "cyan" },
            },
            {
                "<leader>dr",
                "<cmd>RenderMarkdown<cr>",
                desc = "Render markdown",
                icon = { icon = "", color = "greeen" },
            },
            {
                "<leader>ds",
                "<cmd>SessionRestore<cr>",
                desc = "load session",
                icon = { icon = "", color = "orange" },
            },
            {
                "<leader>dl",
                "<cmd>Leet<cr>",
                desc = "Leetcode",
                icon = { icon = "", color = "red" },
            },
            {
                "<leader>dlr",
                "<cmd>Leet run<cr>",
                desc = "Leetcode run",
                icon = { icon = "", color = "green" },
            },
            {
                "<leader>dls",
                "<cmd>Leet submit<cr>",
                desc = "Leetcode submit",
                icon = { icon = "󰁜", color = "green" },
            },
            {
                "<leader>dll",
                "<cmd>Leet last_submit<cr>",
                desc = "Leetcode last submit",
                icon = { icon = "󰁂", color = "orange" },
            },
            {
                "<leader>dlc",
                "<cmd>Leet console<cr>",
                desc = "Leet console",
                icon = { icon = "", color = "cyan" },
            },
            icon = { icon = "󰛂", color = "green" },
        },
    },

    -- Insert mode mappings
    {
        mode = "i",
        { "<A-j>", "<Esc><cmd>m .+1<cr>==gi", desc = "Move line down" },
        { "<A-k>", "<Esc><cmd>m .-2<cr>==gi", desc = "Move line up" },
    },

    -- Visual mode mappings
    {
        mode = "v",
        { "p", '"_dP', desc = "Paste without yanking" },
        { "<", "<gv", desc = "Indent left and reselect" },
        { ">", ">gv", desc = "Indent right and reselect" },
        { "m", "<cmd>'<,'>MCvisual<cr>", desc = "Create multiple cursors (visual)" },
        {
            "<A-k>",
            function()
                require("moveline").block_up()
            end,
            desc = "Move block up",
        },
        {
            "<A-j>",
            function()
                require("moveline").block_down()
            end,
            desc = "Move block down",
        },
    },

    -- All
    {
        mode = { "n", "v", "i" },
        {
            "<M-w>",
            function()
                Snacks.bufdelete()
            end,
            desc = "Close current buffer",
        },
        { "<M-S-Tab>", "<cmd>BufferLineCyclePrev<cr>", desc = "Switch to previous buffer" },
        { "<M-Tab>", "<cmd>BufferLineCycleNext<cr>", desc = "Switch to next buffer" },
        { "<D-a>", "<esc>ggVG", desc = "Select all text" },
        { "<D-s>", "<cmd>w", desc = "Save file" },
    },
})

-- Buffer number mappings
for i = 1, 9 do
    wk.add({
        {
            "<M-" .. i .. ">",
            "<cmd>BufferLineGoToBuffer " .. i .. " <cr>",
            desc = "Go to buffer " .. i,
            mode = { "n", "i", "v" },
        },
    })
end

-- Set leader key
vim.g.mapleader = " "
vim.g.maplocalleader = ","
vim.o.formatexpr = "v:lua.require'conform'.formatexpr()"
wk.add({ { "<Space>", "<Nop>", desc = "<space>" } })

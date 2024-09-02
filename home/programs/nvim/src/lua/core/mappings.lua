-- NOTE: Keymaps here
local wk = require("which-key")

wk.add({
    -- Normal mode mappings
    {
        mode = "n",
        -- Window navigation
        { "<C-h>",     "<C-w>h",                      desc = "Move to left window" },
        { "<C-j>",     "<C-w>j",                      desc = "Move to bottom window" },
        { "<C-k>",     "<C-w>k",                      desc = "Move to top window" },
        { "<C-l>",     "<C-w>l",                      desc = "Move to right window" },

        -- Window resizing
        { "<c-up>",    "<cmd>resize -2<cr>",          desc = "decrease window height" },
        { "<c-down>",  "<cmd>resize +2<cr>",          desc = "increase window height" },
        { "<c-left>",  "<cmd>vertical resize -2<cr>", desc = "decrease window width" },
        { "<c-right>", "<cmd>vertical resize +2<cr>", desc = "increase window width" },

        -- leader mappings
        {
            "<leader>h",
            "<cmd>nohlsearch<cr>",
            desc = "clear search highlights",
            icon = { icon = "", color = "orange" },
        },
        { "<leader>e", "<cmd>NvimTreeToggle<cr>", desc = "toggle nvimtree ", icon = { icon = "", color = "azure" } },
        { "<leader>a", "<cmd>Alpha<cr>", desc = "go to alpha screen", icon = { icon = "󱌎", color = "purple" } },
        { "<leader>w", "<cmd>w<cr>", desc = "save file", icon = { icon = "󰆓", color = "green" } },
        { "<leader>q", "<cmd>q<cr>", desc = "quit", icon = { icon = "󰈆", color = "yellow" } },
        { "<leader>q", "<cmd>q!<cr>", desc = "quit without saving", icon = { icon = "", color = "red" } },

        -- file operations
        {
            group = "Telescope",
            { "<leader>f", desc = "Telescope" },
            {
                "<leader>fg",
                "<cmd>Telescope live_grep<cr>",
                desc = "Live grep",
                icon = { icon = "󱎸", color = "cyan" },
            },
            {
                "<leader>ff",
                "<cmd>Telescope find_files<cr>",
                desc = "Find files",
                icon = { icon = "", color = "green" },
            },
            {
                "<leader>ft",
                "<cmd>Telescope oldfiles<cr>",
                desc = "Find history",
                icon = { icon = "", color = "blue" },
            },
            {
                "<leader>fd",
                "<cmd>Telescope git_files<cr>",
                desc = "Find git files",
                icon = { icon = "", color = "orange" },
            },
            {
                "<leader>fo",
                "<cmd>Telescope workspaces<cr>",
                desc = "Open workspace",
                icon = { icon = "", color = "red" },
            },
            {
                "<leader>f<Tab>",
                "<cmd>Telescope buffers<cr>",
                desc = "Find buffers",
                icon = { icon = "󱦞", color = "yellow" },
            },
            icon = { icon = "", color = "cyan" },
        },

        -- LSP operations
        {
            group = "LSP",
            { "<leader>l", desc = "LSP" },
            {
                "<leader>ld",
                "<cmd>Telescope lsp_document_symbols<cr>",
                desc = "Find document symbols",
                icon = { icon = "", color = "blue" },
            },
            {
                "<leader>li",
                "<cmd>Telescope lsp_references<cr>",
                desc = "Find references",
                icon = { icon = "", color = "orange" },
            },
            {
                "<leader>lh",
                "<cmd>Telescope lsp_dynamic_workspace_symbols<cr>",
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
                "<cmd>lua vim.lsp.buf.format{ async = true }<cr>",
                desc = "Format buffer",
                icon = { icon = "󰉶", color = "azure" },
            },
            icon = { icon = "󰮄", color = "yellow" },
        },
        -- Diagnostics
        {
            group = "Diagnostics",
            { "<leader>x",  desc = "Diagnostics" },
            { "<leader>xx", "<cmd>Trouble diagnostics<cr>",   desc = "Open Trouble diagnostics", icon = { icon = "", color = "red" } },
            { "<leader>xt", "<cmd>Telescope diagnostics<cr>", desc = "Open Telescope diagnostics", icon = { icon = "", color = "cyan" } },
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
            { "<leader>g", desc = "Git" },
            {
                "<leader>gc",
                "<cmd>Telescope git_commits<cr>",
                desc = "Git commits",
                icon = { icon = "", color = "green" },
            },
            { "<leader>gt", "<cmd>Telescope git_status<cr>", desc = "Git status" },
            { "<leader>gg", "<cmd>LazyGit<cr>", desc = "Open LazyGit", icon = { icon = "", color = "purple" } },
            { "<leader>gv", "<cmd>DiffviewOpen<cr>", desc = "Open diffview", icon = { icon = "", color = "blue" } },
            {
                "<leader>gV",
                "<cmd>DiffviewClose<cr>",
                desc = "Close diffview",
                icon = { icon = "", color = "yellow" },
            },
        },
        {
            group = "Go to",
            { "g",  desc = "Go to" },
            { "gd", "<cmd>lua vim.lsp.buf.definition()<cr>",      desc = "Go to definition" },
            { "gD", "<cmd>lua vim.lsp.buf.declaration()<cr>",     desc = "Go to declaration" },
            { "gi", "<cmd>lua vim.lsp.buf.implementation()<cr>",  desc = "Go to implementation" },
            { "gt", "<cmd>lua vim.lsp.buf.type_definition()<cr>", desc = "Go to type definition" },
            { "gr", "<cmd>lua vim.lsp.buf.references()<cr>",      desc = "Go to references" },
            { "gs", "<cmd>lua vim.lsp.buf.signature_help()<cr>",  desc = "Show signature help" },
        },

        -- Multicursor
        { "m",       "<cmd>MCstart<cr>",                 desc = "Create multiple cursors (normal)" },

        -- Buffer management
        { "<M-w>",   "<cmd>Bdelete<cr>",                 desc = "Close current buffer" },
        { "<M-Tab>", "<cmd>BufferLineCycleNext<cr>",     desc = "Switch to next buffer" },

        -- Other
        { "K",       "<cmd>lua vim.lsp.buf.hover()<cr>", desc = "Show hover information" },

        { "<A-k>",   "<cmd>m .-2<cr>",                   desc = "Move line up" },
        { "<A-j>",   "<cmd>m .+1<cr>",                   desc = "Move line down" },

    },

    -- Insert mode mappings
    {
        mode = "i",
        { "jk",    "<ESC>",                   desc = "Quick escape to normal mode" },
        { "<A-j>", "<Esc><cmd>m .+1<cr>==gi", desc = "Move line down" },
        { "<A-k>", "<Esc><cmd>m .-2<cr>==gi", desc = "Move line up" },
    },

    -- Visual mode mappings
    {
        mode = "v",
        { "p", '"_dP',                   desc = "Paste without yanking" },
        { "<", "<gv",                    desc = "Indent left and reselect" },
        { ">", ">gv",                    desc = "Indent right and reselect" },
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
        { "<D-a>", "<esc>ggVG", desc = "Select all text" },
    },
})

-- Buffer number mappings
for i = 1, 9 do
    wk.add({
        { "<M-" .. i .. ">", "<cmd>BufferLineGoToBuffer " .. i .. " <cr>", desc = "Go to buffer " .. i, mode = "n" },
    })
end

-- Set leader key
vim.g.mapleader = " "
wk.add({ { "<Space>", "<Nop>", desc = "<space>" } })

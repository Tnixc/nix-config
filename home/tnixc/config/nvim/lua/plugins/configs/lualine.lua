-- Eviline config for lualine
-- Author: shadmansaleh
-- Credit: glepnir
-- Color table for highlights
-- stylua: ignore

local colors = require("catppuccin.palettes").get_palette("macchiato")
local mode_color = {
    n = colors.yellow,
    i = colors.green,
    v = colors.blue,
    ["\22"] = colors.blue,
    V = colors.blue,
    c = colors.mauve,
    no = colors.red,
    s = colors.orange,
    S = colors.orange,
    [""] = colors.orange,
    ic = colors.yellow,
    R = colors.mauve,
    Rv = colors.mauve,
    cv = colors.red,
    ce = colors.red,
    r = colors.sky,
    rm = colors.sky,
    ["r?"] = colors.sky,
    ["!"] = colors.red,
    t = colors.red,
}

local conditions = {
    buffer_not_empty = function()
        return vim.fn.empty(vim.fn.expand("%:t")) ~= 1
    end,
    hide_in_width = function()
        return vim.fn.winwidth(0) > 80
    end,
    check_git_workspace = function()
        local filepath = vim.fn.expand("%:p:h")
        local gitdir = vim.fn.finddir(".git", filepath .. ";")
        return gitdir and #gitdir > 0 and #gitdir < #filepath
    end,
}

-- Config
local config = {
    options = {
        -- Disable sections and component separators
        component_separators = "",
        section_separators = "",
        theme = {
            normal = { c = { fg = colors.text, bg = colors.mantle } },
            inactive = { c = { fg = colors.text, bg = colors.mantle } },
        },
    },
    sections = {
        -- these are to remove the defaults
        lualine_a = {},
        lualine_b = {},
        lualine_y = {},
        lualine_z = {},
        -- These will be filled later
        lualine_c = {},
        lualine_x = {},
    },
    inactive_sections = {
        -- these are to remove the defaults
        lualine_a = {},
        lualine_b = {},
        lualine_y = {},
        lualine_z = {},
        lualine_c = {},
        lualine_x = {},
    },
}

-- Inserts a component in lualine_c at left section
local function ins_left(component)
    table.insert(config.sections.lualine_c, component)
end

-- Inserts a component in lualine_x at right section
local function ins_right(component)
    table.insert(config.sections.lualine_x, component)
end

ins_left({
    -- mode component
    function()
        local mode_names = {
            n = "􀬑  NORMAL",
            i = "􀅫  INSERT",
            v = "􀑠  VISUAL",
            ["\22"] = "􀑠  V-BLOCK",
            V = "􂬁  V-LINE",
            c = "􀆔 COMMAND",
            no = "OPERATOR",
            s = "SELECT",
            S = "S-LINE",
            -- pretty sure some of these don't exist
            ic = "ITALIC",
            R = "􀈏  REPLACE",
            Rv = "􀈏  V-REPLACE",
            cv = "COMMAND",
            ce = "NORMAL",
            r = "PROMPT",
            rm = "MORE",
            ["r?"] = "CONFIRM",
            ["!"] = "􀩼  SHELL",
            t = "􀩼  TERMINAL",
        }
        return mode_names[vim.fn.mode()] or ""
    end,
    color = function()
        -- auto change color according to neovims mode
        return { fg = colors.mantle, bg = mode_color[vim.fn.mode()], gui = "bold" }
    end,
    padding = { left = 1, right = 1 },
})

ins_left({ "location", color = { fg = colors.text, bg = colors.overlay0 } })

ins_left({ "progress", color = { fg = colors.flamingo, bg = colors.surface2 }, padding = { left = 1, right = 1 } })

ins_left({
    "branch",
    icon = "",
    color = { bg = colors.surface0, fg = colors.green, gui = "bold" },
})

ins_left({
    "diff",
    source = function()
        local summary = vim.b.minidiff_summary
        if summary then
            return {
                added = summary.add,
                modified = summary.change,
                removed = summary.delete,
            }
        end
    end,
    symbols = { added = "􀑍 ", modified = "􁚛 ", removed = "􀺾 " },
    diff_color = {
        added = { fg = colors.green },
        modified = { fg = colors.yellow },
        removed = { fg = colors.red },
    },
})

ins_left({
    require("noice").api.statusline.mode.get,
    cond = require("noice").api.statusline.mode.has,
    color = { fg = colors.orange },
})

ins_left({
    function()
        local msg = require("lsp-progress").progress()
        if #msg > 40 then
            return msg:sub(1, 40)
        end
        return msg
    end,
    color = { fg = colors.pink },
})

ins_right({
    "filename",
    icon = "􀈿 ",
    path = 1, -- 0 = just filename, 1 = relative path, 2 = absolute path, 3 = absolute path with ~
    cond = conditions.buffer_not_empty,
    color = { fg = colors.sapphire },
})

ins_right({
    "diagnostics",
    sources = { "nvim_diagnostic" },
    symbols = { error = "􀃰 ", warn = "􀼳 ", info = "􁊇 ", hint = "􀤘 " },
    diagnostics_color = {
        color_error = { fg = colors.red },
        color_warn = { fg = colors.peach },
        color_info = { fg = colors.sapphire },
        color_hint = { fg = colors.teal },
    },
})
ins_right({
    function()
        -- Check if 'conform' is available
        local status, conform = pcall(require, "conform")
        if not status then
            return "Conform not installed"
        end

        local lsp_format = require("conform.lsp_format")

        -- Get formatters for the current buffer
        local formatters = conform.list_formatters_for_buffer()
        if formatters and #formatters > 0 then
            local formatterNames = {}

            for _, formatter in ipairs(formatters) do
                table.insert(formatterNames, formatter)
            end

            return "􀉇  " .. table.concat(formatterNames, " ")
        end

        -- Check if there's an LSP formatter
        local bufnr = vim.api.nvim_get_current_buf()
        local lsp_clients = lsp_format.get_format_clients({ bufnr = bufnr })

        if not vim.tbl_isempty(lsp_clients) then
            return "􀉇  LSP Formatter"
        end

        return ""
    end,
    color = { fg = colors.peach, bg = colors.surface0 },
})
-- Insert mid section. You can make any number of sections in neovim :)
-- for lualine it's any number greater then 2
ins_right({
    -- Lsp server name .
    function()
        local msg = "No Active Lsp"
        local buf_ft = vim.api.nvim_buf_get_option(0, "filetype")
        local clients = vim.lsp.get_clients()
        if next(clients) == nil then
            return msg
        end

        -- Priority order for main language servers
        local priority_servers = {
            "vtsls",
            "ts_ls",
            "lua_ls",
            "pyright",
            "rust_analyzer",
            "gopls",
            "ocamllsp",
            "svelte",
            "astro",
        }

        -- First try to find priority servers
        for _, priority in ipairs(priority_servers) do
            for _, client in ipairs(clients) do
                local filetypes = client.config.filetypes
                if client.name == priority and filetypes and vim.fn.index(filetypes, buf_ft) ~= -1 then
                    return client.name
                end
            end
        end

        -- Fall back to any other attached server (excluding utility servers)
        local exclude = { "tailwindcss", "null-ls" }
        for _, client in ipairs(clients) do
            local filetypes = client.config.filetypes
            if filetypes and vim.fn.index(filetypes, buf_ft) ~= -1 and vim.fn.index(exclude, client.name) == -1 then
                return client.name
            end
        end

        return msg
    end,
    icon = "􀱢 ",
    color = { fg = colors.mauve, bg = colors.surface2, gui = "bold" },
})

ins_right({
    "copilot",
    show_colors = true,
    symbols = {
        spinners = "dots",
    },
    color = { bg = colors.overlay0 },
})

require("lualine").setup(config)

-- Listen to lsp-progress event and refresh lualine
vim.api.nvim_create_augroup("lualine_augroup", { clear = true })
vim.api.nvim_create_autocmd("User", {
    group = "lualine_augroup",
    pattern = "LspProgressStatusUpdated",
    callback = require("lualine").refresh,
})

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

ins_left({
    function()
        return ""
    end,
    color = function()
        return { fg = mode_color[vim.fn.mode()], bg = colors.bg }
    end,
    padding = { left = 0, right = 0 },
})

ins_left({ "location" })

ins_left({ "progress", color = { fg = colors.flamingo }, padding = { left = 0, right = 1 } })

ins_left({
    "branch",
    icon = "",
    color = { fg = colors.lavender, gui = "bold" },
})

ins_left({
    "diff",
    source = function()
        local gitsigns = vim.b.gitsigns_status_dict
        if gitsigns then
            return {
                added = gitsigns.added,
                modified = gitsigns.changed,
                removed = gitsigns.removed,
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
            return msg:sub(1, 37) .. "..."
        end
        return msg
    end,
    color = { fg = colors.pink },
})

ins_right({
    -- filesize component
    "filesize",
    icon = "􀎾 ",
    cond = conditions.buffer_not_empty,
    color = { fg = colors.sky },
})

ins_right({
    "filename",
    icon = "􀈿 ",
    cond = conditions.buffer_not_empty,
    color = { fg = colors.sapphire },
})

ins_right({
    "diagnostics",
    sources = { "nvim_diagnostic" },
    symbols = { error = "􀃰 ", warn = "􀃮 ", info = "􁊇 " },
    diagnostics_color = {
        color_error = { fg = colors.red },
        color_warn = { fg = colors.peach },
        color_info = { fg = colors.sapphire },
    },
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
    color = { fg = colors.mauve, gui = "bold" },
})

require("lualine").setup(config)

-- Listen to lsp-progress event and refresh lualine
vim.api.nvim_create_augroup("lualine_augroup", { clear = true })
vim.api.nvim_create_autocmd("User", {
    group = "lualine_augroup",
    pattern = "LspProgressStatusUpdated",
    callback = require("lualine").refresh,
})

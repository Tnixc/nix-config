local alpha = require("alpha")
local dashboard = require("alpha.themes.dashboard")

dashboard.section.header.val = require("plugins.configs.alpha_header")

local function button(sc, txt, leader_txt, keybind, keybind_opts)
    local sc_after = sc:gsub("%s", ""):gsub(leader_txt, "<leader>")

    local opts = {
        position = "center",
        shortcut = sc,
        cursor = 2,
        width = 50,
        align_shortcut = "right",
        hl = "AlphaButton",
        hl_shortcut = "AlphaAttr",
    }

    if nil == keybind then
        keybind = sc_after
    end
    keybind_opts = vim.F.if_nil(keybind_opts, { noremap = true, silent = true, nowait = true })
    opts.keymap = { "n", sc_after, keybind, keybind_opts }

    local function on_press()
        -- local key = vim.api.nvim_replace_termcodes(keybind .. '<Ignore>', true, false, true)
        local key = vim.api.nvim_replace_termcodes(sc_after .. "<Ignore>", true, false, true)
        vim.api.nvim_feedkeys(key, "t", false)
    end

    return {
        type = "button",
        val = txt,
        on_press = on_press,
        opts = opts,
    }
end

local leader = " "
dashboard.section.buttons.val = {
    button("f", "  Open file", leader, nil, {
        noremap = true,
        silent = true,
        nowait = true,
        callback = function()
            require("telescope.builtin").find_files()
        end,
    }),
    button("h", "  File history", leader, nil, {
        noremap = true,
        silent = true,
        nowait = true,
        callback = function()
            require("telescope.builtin").oldfiles()
        end,
    }),
    button("n", "  New File", leader, nil, {
        noremap = true,
        silent = true,
        nowait = true,
        callback = function()
            vim.api.nvim_command("enew")
        end,
    }),
    button("g", "  Live grep", leader, nil, {
        noremap = true,
        silent = true,
        nowait = true,
        callback = function()
            require("telescope.builtin").live_grep()
        end,
    }),
    button("q", "  Quit", leader, nil, {
        noremap = true,
        silent = true,
        nowait = true,
        callback = function()
            vim.cmd("qa")
        end,
    }),
}

dashboard.section.buttons.opts.hl = "AlphaButton"

local function footer()
    local stats = require("lazy").stats()
    local ms = (math.floor(stats.startuptime * 100 + 0.5) / 100)
    return "   Neovim"
        .. "  󰀨  v"
        .. vim.version().major
        .. "."
        .. vim.version().minor
        .. "."
        .. vim.version().patch
        .. "  󰂖 "
        .. stats.count
        .. " plugins loaded "
        .. ms
        .. "ms"
end

dashboard.section.footer.val = footer()
dashboard.section.footer.opts.hl = "Comment"

local head_butt_padding = 2
local occu_height = #dashboard.section.header.val + 2 * #dashboard.section.buttons.val + head_butt_padding
local header_padding = math.max(0, math.ceil((vim.fn.winheight("$") - occu_height) * 0.25))
local foot_butt_padding = 1

dashboard.config.layout = {
    { type = "padding", val = header_padding },
    dashboard.section.header,
    { type = "padding", val = head_butt_padding },
    dashboard.section.buttons,
    { type = "padding", val = foot_butt_padding },
    dashboard.section.footer,
}

alpha.setup(dashboard.opts)

vim.api.nvim_create_autocmd("User", {
    pattern = "LazyVimStarted",
    callback = function()
        dashboard.section.footer.val = footer()
        pcall(vim.cmd.AlphaRedraw)
    end,
})
vim.api.nvim_create_augroup("alpha_on_empty", { clear = true })

local function should_show_alpha()
    -- Don't show if there are multiple windows (splits)
    if vim.fn.winnr("$") > 1 then
        return false
    end

    -- Get current buffer info
    local buf = vim.api.nvim_get_current_buf()
    local bufname = vim.api.nvim_buf_get_name(buf)
    local bufft = vim.bo[buf].filetype
    local buftype = vim.bo[buf].buftype
    local modified = vim.bo[buf].modified
    local line_count = vim.api.nvim_buf_line_count(buf)

    -- Check if it's an empty unnamed buffer
    local is_empty = bufname == "" and bufft == "" and buftype == "" and not modified and line_count <= 1

    -- Also check if only content is empty
    if is_empty and line_count == 1 then
        local first_line = vim.api.nvim_buf_get_lines(buf, 0, 1, false)[1]
        is_empty = first_line == ""
    end

    return is_empty
end

-- Handle bufdelete.nvim events
vim.api.nvim_create_autocmd("User", {
    pattern = "BDeletePost*",
    group = "alpha_on_empty",
    callback = function()
        if should_show_alpha() then
            vim.cmd("Alpha")
        end
    end,
})

-- Handle regular buffer deletion and other events that might leave blank buffers
vim.api.nvim_create_autocmd({ "BufDelete", "BufEnter" }, {
    group = "alpha_on_empty",
    callback = function()
        vim.schedule(function()
            if should_show_alpha() then
                vim.cmd("Alpha")
            end
        end)
    end,
})

-- Handle auto-session restore to blank buffer
vim.api.nvim_create_autocmd("SessionLoadPost", {
    group = "alpha_on_empty",
    callback = function()
        vim.schedule(function()
            if should_show_alpha() then
                vim.cmd("Alpha")
            end
        end)
    end,
})

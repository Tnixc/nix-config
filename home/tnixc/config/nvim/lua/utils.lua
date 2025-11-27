-- Utility functions

local M = {}

-- Toggle diffview open/close
M.toggle_diffview = function()
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

return M

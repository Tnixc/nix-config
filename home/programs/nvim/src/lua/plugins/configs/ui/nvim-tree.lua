require("nvim-tree").setup({
    renderer = {
        root_folder_label = true,
        indent_markers = {
            enable = true,
        },
        icons = {
            glyphs = {
                default = " ",
                symlink = " ",
                git = {
                    unstaged = "󰆢",
                    staged = "",
                    unmerged = "",
                    renamed = "➜",
                    untracked = "󰄗",
                    deleted = "",
                    ignored = "󰫌",
                },
            },
            show = {
                git = true,
                folder = true,
                file = true,
                folder_arrow = true,
            },
        },
    },
    actions = {
        open_file = {
            quit_on_open = true,
            window_picker = {
                exclude = {
                    filetype = {
                        "packer",
                        "qf",
                    },
                    buftype = {
                        "terminal",
                        "help",
                    },
                },
            },
        },
    },
    filters = {
        exclude = { ".git", "node_modules", ".cache" },
    },
    update_focused_file = {
        enable = true,
        update_root = true,
    },

    hijack_directories = { enable = true },
    view = {
        width = "20%",
        side = "right",
    },
})
vim.cmd([[
autocmd BufEnter * ++nested if winnr('$') == 1 && bufname() == 'NvimTree_' . tabpagenr() | quit | endif
nnoremap <leader>cd :cd %:p:h<CR>:pwd<CR>
]])

-- auto close:
local function is_modified_buffer_open(buffers)
    for _, v in pairs(buffers) do
        if v.name:match("NvimTree_") == nil then
            return true
        end
    end
    return false
end

vim.api.nvim_create_autocmd("BufEnter", {
    nested = true,
    callback = function()
        if
            #vim.api.nvim_list_wins() == 1
            and vim.api.nvim_buf_get_name(0):match("NvimTree_") ~= nil
            and is_modified_buffer_open(vim.fn.getbufinfo({ bufmodified = 1 })) == false
        then
            vim.cmd("quit")
        end
    end,
})

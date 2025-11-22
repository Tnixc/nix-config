local Layout = require("nui.layout")
local Popup = require("nui.popup")
local TSLayout = require("telescope.pickers.layout")
local actions = require("telescope.actions")

local function make_popup(options)
    local popup = Popup(options)
    function popup.border:change_title(title)
        popup.border.set_text(popup.border, "top", title)
    end
    return TSLayout.Window(popup)
end

require("telescope").setup({
    defaults = {
        layout_strategy = "flex",
        layout_config = {
            horizontal = {
                size = {
                    width = "90%",
                    height = "60%",
                },
            },
            vertical = {
                size = {
                    width = "90%",
                    height = "90%",
                },
            },
        },
        find_command = {
            "rg",
            "--no-heading",
            "--with-filename",
            "--line-number",
            "--column",
            "--smart-case",
        },
        prompt_prefix = " 􀊫  ",
        selection_caret = "  ",
        entry_prefix = "  ",
        initial_mode = "insert",
        selection_strategy = "reset",
        sorting_strategy = "ascending",
        file_sorter = require("telescope.sorters").get_fuzzy_file,
        file_ignore_patterns = {},
        generic_sorter = require("telescope.sorters").get_generic_fuzzy_sorter,
        path_display = {},
        winblend = 0,
        color_devicons = true,
        use_less = true,
        set_env = { ["COLORTERM"] = "truecolor" },
        file_previewer = require("telescope.previewers").vim_buffer_cat.new,
        grep_previewer = require("telescope.previewers").vim_buffer_vimgrep.new,
        qflist_previewer = require("telescope.previewers").vim_buffer_qflist.new,
        buffer_previewer_maker = require("telescope.previewers").buffer_previewer_maker,
        mappings = {
            i = {
                ["<C-j>"] = actions.move_selection_next,
                ["<C-k>"] = actions.move_selection_previous,
                ["<C-q>"] = actions.smart_send_to_qflist + actions.open_qflist,
                ["<esc>"] = actions.close,
                ["<CR>"] = actions.select_default + actions.center,
            },
            n = {
                ["<C-j>"] = actions.move_selection_next,
                ["<C-k>"] = actions.move_selection_previous,
                ["<C-q>"] = actions.smart_send_to_qflist + actions.open_qflist,
            },
        },
        create_layout = function(picker)
            local border = {
                results = {
                    top_left = "┌",
                    top = "─",
                    top_right = "┬",
                    right = "│",
                    bottom_right = "",
                    bottom = "",
                    bottom_left = "",
                    left = "│",
                },
                results_patch = {
                    minimal = {
                        top_left = "┌",
                        top_right = "┐",
                    },
                    horizontal = {
                        top_left = "┌",
                        top_right = "┬",
                    },
                    vertical = {
                        top_left = "├",
                        top_right = "┤",
                    },
                },
                prompt = {
                    top_left = "├",
                    top = "─",
                    top_right = "┤",
                    right = "│",
                    bottom_right = "┘",
                    bottom = "─",
                    bottom_left = "└",
                    left = "│",
                },
                prompt_patch = {
                    minimal = {
                        bottom_right = "┘",
                    },
                    horizontal = {
                        bottom_right = "┴",
                    },
                    vertical = {
                        bottom_right = "┘",
                    },
                },
                preview = {
                    top_left = "┌",
                    top = "─",
                    top_right = "┐",
                    right = "│",
                    bottom_right = "┘",
                    bottom = "─",
                    bottom_left = "└",
                    left = "│",
                },
                preview_patch = {
                    minimal = {},
                    horizontal = {
                        bottom = "─",
                        bottom_left = "",
                        bottom_right = "┘",
                        left = "",
                        top_left = "",
                    },
                    vertical = {
                        bottom = "",
                        bottom_left = "",
                        bottom_right = "",
                        left = "│",
                        top_left = "┌",
                    },
                },
            }

            local results = make_popup({
                focusable = false,
                border = {
                    style = border.results,
                    text = {
                        top = require("nui.text")(" " .. picker.results_title .. " ", "TelescopeResultsTitle"),
                        top_align = "center",
                    },
                },
                win_options = {
                    winhighlight = "Normal:TelescopeNormal,FloatBorder:BGFloatBorder",
                },
            })

            local prompt = make_popup({
                enter = true,
                border = {
                    style = border.prompt,
                    text = {
                        top = require("nui.text")(" " .. picker.prompt_title .. " ", "TelescopePromptTitle"),
                        top_align = "center",
                    },
                },
                win_options = {
                    winhighlight = "Normal:TelescopeNormal,FloatBorder:BGFloatBorder",
                },
            })

            local preview = make_popup({
                focusable = false,
                border = {
                    style = border.preview,
                    text = {
                        top = require("nui.text")(" " .. picker.preview_title .. " ", "TelescopePreviewTitle"),
                        top_align = "center",
                    },
                },
                win_options = {
                    winhighlight = "Normal:TelescopeNormal,FloatBorder:BGFloatBorder",
                },
            })

            local box_by_kind = {
                vertical = Layout.Box({
                    Layout.Box(preview, { grow = 1 }),
                    Layout.Box(results, { grow = 1 }),
                    Layout.Box(prompt, { size = 3 }),
                }, { dir = "col" }),
                horizontal = Layout.Box({
                    Layout.Box({
                        Layout.Box(results, { grow = 1 }),
                        Layout.Box(prompt, { size = 3 }),
                    }, { dir = "col", size = "50%" }),
                    Layout.Box(preview, { size = "50%" }),
                }, { dir = "row" }),
                minimal = Layout.Box({
                    Layout.Box(results, { grow = 1 }),
                    Layout.Box(prompt, { size = 3 }),
                }, { dir = "col" }),
            }

            local function get_box()
                local strategy = picker.layout_strategy
                if strategy == "vertical" or strategy == "horizontal" then
                    return box_by_kind[strategy], strategy
                end

                local height, width = vim.o.lines, vim.o.columns
                local box_kind = "horizontal"
                if width < 100 then
                    box_kind = "vertical"
                    if height < 40 then
                        box_kind = "minimal"
                    end
                end
                return box_by_kind[box_kind], box_kind
            end

            local function prepare_layout_parts(layout, box_type)
                layout.results = results
                results.border:set_style(border.results_patch[box_type])

                layout.prompt = prompt
                prompt.border:set_style(border.prompt_patch[box_type])

                if box_type == "minimal" then
                    layout.preview = nil
                else
                    layout.preview = preview
                    preview.border:set_style(border.preview_patch[box_type])
                end
            end

            local function get_layout_size(box_kind)
                return picker.layout_config[box_kind == "minimal" and "vertical" or box_kind].size
            end

            local box, box_kind = get_box()
            local layout = Layout({
                relative = "editor",
                position = "50%",
                size = get_layout_size(box_kind),
            }, box)

            layout.picker = picker
            prepare_layout_parts(layout, box_kind)

            local layout_update = layout.update
            function layout:update()
                local box, box_kind = get_box()
                prepare_layout_parts(layout, box_kind)
                layout_update(self, { size = get_layout_size(box_kind) }, box)
            end

            return TSLayout(layout)
        end,
    },
    extensions = {
        undo = {},
        ["ui-select"] = {
            require("telescope.themes").get_dropdown({}),
        },
        workspaces = {
            keep_insert = true,
            path_hl = "Delimiter",
        },
    },
})

require("telescope").load_extension("undo")
require("telescope").load_extension("ui-select")
require("telescope").load_extension("workspaces")
require("telescope").load_extension("noice")

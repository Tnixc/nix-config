-- Shorten function name
local keymap = vim.keymap.set

-- Silent keymap option
local opts = { silent = true }

--Remap space as leader key
keymap("", "<Space>", "<Nop>", { desc = "<space>", silent = true })
vim.g.mapleader = " "

-- Modes
--   normal_mode = "n",
--   insert_mode = "i",
--   visual_mode = "v",
--   visual_block_mode = "x",
--   term_mode = "t",
--   command_mode = "c",

-- Normal --
-- Better window navigation
keymap("n", "<C-h>", "<C-w>h", { desc = "Move to left window", silent = true })
keymap("n", "<C-j>", "<C-w>j", { desc = "Move to bottom window", silent = true })
keymap("n", "<C-k>", "<C-w>k", { desc = "Move to top window", silent = true })
keymap("n", "<C-l>", "<C-w>l", { desc = "Move to right window", silent = true })

-- Resize with arrows
keymap("n", "<C-Up>", "<cmd>resize -2<CR>", { desc = "Decrease window height", silent = true })
keymap("n", "<C-Down>", "<cmd>resize +2<CR>", { desc = "Increase window height", silent = true })
keymap("n", "<C-Left>", "<cmd>vertical resize -2<CR>", { desc = "Decrease window width", silent = true })
keymap("n", "<C-Right>", "<cmd>vertical resize +2<CR>", { desc = "Increase window width", silent = true })

-- Clear highlights
keymap("n", "<leader>h", "<cmd>nohlsearch<CR>", { desc = "Clear search highlights", silent = true })

-- Better paste
keymap("v", "p", '"_dP', { desc = "Paste without yanking", silent = true })

-- Insert --
-- Press jk fast to enter normal mode
keymap("i", "jk", "<ESC>", { desc = "Quick escape to normal mode", silent = true })

-- Visual --
-- Stay in indent mode
keymap("v", "<", "<gv", { desc = "Indent left and reselect", silent = true })
keymap("v", ">", ">gv", { desc = "Indent right and reselect", silent = true })

-- Plugins --

-- Yazi
keymap("n", "<leader>fr", "<cmd>Yazi<CR>", { desc = "Open Yazi file manager", silent = true })

-- Telescope
keymap("n", "<leader>ft", "<cmd>Telescope find_files<CR>", { desc = "Find files", silent = true })
keymap("n", "<leader>fg", "<cmd>Telescope live_grep<CR>", { desc = "Live grep", silent = true })
keymap("n", "<leader>fb", "<cmd>Telescope buffers<CR>", { desc = "Find buffers", silent = true })
keymap("n", "<leader>ff", "<cmd>Telescope oldfiles<CR>", { desc = "Find recent files", silent = true })
keymap("n", "<leader>fd", "<cmd>Telescope git_files<CR>", { desc = "Find git files", silent = true })
keymap("n", "<leader>fo", "<cmd>Telescope workspaces<CR>", { desc = "Open workspace", silent = true })

keymap("n", "<leader>;", "<cmd>Telescope commands<CR>", { desc = "Find commands", silent = true })

-- git
keymap("n", "<leader>cm", "<cmd>Telescope git_commits<CR>", { desc = "Git commits", silent = true })
keymap("n", "<leader>gt", "<cmd>Telescope git_status<CR>", { desc = "Git status", silent = true })

-- Lsp
keymap("n", "<leader>lf", "<cmd>lua vim.lsp.buf.format{ async = true }<cr>", { desc = "Format code", silent = true })
keymap("n", "<leader>lr", "<cmd>lua vim.lsp.buf.rename()<cr>", { desc = "Rename symbol", silent = true })

keymap("n", "K", "<cmd>lua vim.lsp.buf.hover()<cr>", { desc = "Show hover information", silent = true })
keymap("n", "gd", "<cmd>lua vim.lsp.buf.definition()<cr>", { desc = "Go to definition", silent = true })
keymap("n", "gD", "<cmd>lua vim.lsp.buf.declaration()<cr>", { desc = "Go to declaration", silent = true })
keymap("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<cr>", { desc = "Go to implementation", silent = true })
keymap("n", "gt", "<cmd>lua vim.lsp.buf.type_definition()<cr>", { desc = "Go to type definition", silent = true })
keymap("n", "gr", "<cmd>lua vim.lsp.buf.references()<cr>", { desc = "Find references", silent = true })
keymap("n", "gs", "<cmd>lua vim.lsp.buf.signature_help()<cr>", { desc = "Show signature help", silent = true })

-- Multicursor
keymap("v", "<leader>m", "<cmd>'<,'>MCvisual<CR>", { desc = "Create multiple cursors", silent = true })


-- Move lines up and down in normal mode
keymap("n", "<A-j>", "<cmd>m .+1<CR>==", { desc = "Move line down", silent = true })
keymap("n", "<A-k>", "<cmd>m .-2<CR>==", { desc = "Move line up", silent = true })

-- Move lines up and down in insert mode
keymap("i", "<A-j>", "<Esc><cmd>m .+1<CR>==gi", { desc = "Move line down in insert mode", silent = true })
keymap("i", "<A-k>", "<Esc><cmd>m .-2<CR>==gi", { desc = "Move line up in insert mode", silent = true })

-- Move lines up and down in visual mode
keymap("v", "<A-j>", "<cmd>m '>+1<CR>gv=gv", { desc = "Move selection down", silent = true })
keymap("v", "<A-k>", "<cmd>m '<-2<CR>gv=gv", { desc = "Move selection up", silent = true })

-- LazyGit
keymap("n", "<leader>gg", "<cmd>LazyGit<cr>", { desc = "Open LazyGit", silent = true })

-- Cmd all select
keymap("n", "<D-a>", "ggVG", { desc = "Select all text", silent = true })

-- Tmux Navigator
keymap("n", "<C-j>", "<cmd>TmuxNavigateDown<cr>", { desc = "Navigate down in Tmux", silent = true })
keymap("n", "<C-k>", "<cmd>TmuxNavigateUp<cr>", { desc = "Navigate up in Tmux", silent = true })
keymap("n", "<C-l>", "<cmd>TmuxNavigateRight<cr>", { desc = "Navigate right in Tmux", silent = true })
keymap("n", "<C-h>", "<cmd>TmuxNavigateLeft<cr>", { desc = "Navigate left in Tmux", silent = true })

-- quick commands
keymap("n", "<leader>w", "<cmd>w<cr>", { desc = "Save file", silent = true })
keymap("n", "<leader>q", "<cmd>q<cr>", { desc = "Quit", silent = true })
keymap("n", "<leader>Q", "<cmd>q!<cr>", { desc = "Quit without saving", silent = true })

-- Buffer management
keymap("n", "<M-w>", "<cmd>bdelete<CR>", { desc = "Close current buffer", silent = true })
keymap("n", "<M-Tab>", "<cmd>BufferLineCycleNext<CR>", { desc = "Switch to next buffer", silent = true })

-- Trouble
keymap("n", "<leader>xx", "<cmd>Trouble diagnostics<cr>", { desc = "Open Trouble diagnostics", silent = true })
keymap(
	"n",
	"<leader>xX",
	"<cmd>Trouble diagnostics toggle filter.buf=0<cr>",
	{ desc = "Toggle Trouble diagnostics for current buffer", silent = true }
)

-- NvimTree
keymap("n", "<leader>e", "<cmd>NvimTreeToggle<cr>", { desc = "Toggle NvimTree file explorer", silent = true })

-- Quickly switch to buffer number
for i = 1, 9 do
	keymap(
		"n",
		"<M-" .. i .. ">",
		"<cmd>BufferLineGoToBuffer " .. i .. " <CR>",
		{ desc = "Go to buffer " .. i, silent = true }
	)
end

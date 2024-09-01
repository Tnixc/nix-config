-- Shorten function name
local keymap = vim.keymap.set
-- Silent keymap option
local opts = { silent = true }

--Remap space as leader key
keymap("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "

-- Modes
--   normal_mode = "n",
--   insert_mode = "i",
--   visual_mode = "v",
--   visual_block_mode = "x", term_mode = "t",
--   command_mode = "c",

-- Normal --
-- Better window navigation
keymap("n", "<C-h>", "<C-w>h", opts)
keymap("n", "<C-j>", "<C-w>j", opts)
keymap("n", "<C-k>", "<C-w>k", opts)
keymap("n", "<C-l>", "<C-w>l", opts)

-- Resize with arrows
keymap("n", "<C-Up>", "<cmd>resize -2<CR>", opts)
keymap("n", "<C-Down>", "<cmd>resize +2<CR>", opts)
keymap("n", "<C-Left>", "<cmd>vertical resize -2<CR>", opts)
keymap("n", "<C-Right>", "<cmd>vertical resize +2<CR>", opts)

-- -- Clear highlights
keymap("n", "<leader>h", "<cmd>nohlsearch<CR>", opts)

-- Better paste
keymap("v", "p", '"_dP', opts)

-- Insert --
-- Press jk fast to enter
keymap("i", "jk", "<ESC>", opts)

-- Visual --
-- Stay in indent mode
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)

-- Plugins --

-- Telescope
-- find
keymap("n", "<leader>ft", "<cmd>Telescope find_files<CR>", opts)
keymap("n", "<leader>fg", "<cmd>Telescope live_grep<CR>", opts)
keymap("n", "<leader>fb", "<cmd>Telescope buffers<CR>", opts)
keymap("n", "<leader>ff", "<cmd>Telescope oldfiles<CR>", opts)
keymap("n", "<leader>fr", "<cmd>Yazi<CR>", opts)

-- git
keymap("n", "<leader>cm", "<cmd>Telescope git_commits<CR>", opts)
keymap("n", "<leader>gt", "<cmd>Telescope git_status<CR>", opts)

-- Lsp
keymap("n", "<leader>lf", "<cmd>lua vim.lsp.buf.format{ async = true }<cr>", opts)
keymap("n", "<leader>lr", "<cmd>lua vim.lsp.buf.rename()<cr>", opts)

keymap("n", "K", "<cmd>lua vim.lsp.buf.hover()<cr>", opts)
keymap("n", "gd", "<cmd>lua vim.lsp.buf.definition()<cr>", opts)
keymap("n", "gD", "<cmd>lua vim.lsp.buf.declaration()<cr>", opts)
keymap("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<cr>", opts)
keymap("n", "gt", "<cmd>lua vim.lsp.buf.type_definition()<cr>", opts)
keymap("n", "gr", "<cmd>lua vim.lsp.buf.references()<cr>", opts)
keymap("n", "gs", "<cmd>lua vim.lsp.buf.signature_help()<cr>", opts)

-- Multicursor
keymap("v", "<leader>m", "<cmd>'<,'>MCvisual<CR>", opts)

-- Comment
keymap("v", "<leader>/", "gc", opts)
keymap("n", "<leader>/", "Vgc<esc>", opts)

-- Move lines up and down in normal mode
keymap("n", "<A-j>", "<cmd>m .+1<CR>==", opts)
keymap("n", "<A-k>", "<cmd>m .-2<CR>==", opts)

-- Move lines up and down in insert mode
keymap("i", "<A-j>", "<Esc><cmd>m .+1<CR>==gi", opts)
keymap("i", "<A-k>", "<Esc><cmd>m .-2<CR>==gi", opts)

-- Move lines up and down in visual mode
keymap("v", "<A-j>", "<cmd>m '>+1<CR>gv=gv", opts)
keymap("v", "<A-k>", "<cmd>m '<-2<CR>gv=gv", opts)

-- LazyGit
keymap("n", "<leader>gg", "<cmd>LazyGit<cr>", opts)

-- Cmd all select
keymap("n", "<D-a>", "ggVG", opts)

-- Tmux Navigator
keymap("n", "<C-j>", "<cmd>TmuxNavigateDown<cr>", opts)
keymap("n", "<C-k>", "<cmd>TmuxNavigateUp<cr>", opts)
keymap("n", "<C-l>", "<cmd>TmuxNavigateRight<cr>", opts)
keymap("n", "<C-h>", "<cmd>TmuxNavigateLeft<cr>", opts)

-- quick commands
keymap("n", "<leader>w", "<cmd>w<cr>", opts)
keymap("n", "<leader>q", "<cmd>q<cr>", opts)
keymap("n", "<leader>Q", "<cmd>q!<cr>", opts)

-- Buffer management
keymap("n", "<M-w>", "<cmd>bdelete<CR>", opts)
keymap("n", "<M-Tab>", "<cmd>BufferLineCycleNext<CR>", opts)

-- Trouble
keymap("n", "<leader>xx", "<cmd>Trouble diagnostics<cr>", opts)
keymap("n", "<leader>xX", "<cmd>Trouble diagnostics toggle filter.buf=0<cr>", opts)
 
-- NvimTree
keymap("n", "<leader>e", "<cmd>NvimTreeToggle<cr>", opts)

-- Quickly switch to buffer number
for i = 1, 9 do
	keymap("n", "<M-" .. i .. ">", "<cmd>BufferLineGoToBuffer " .. i .. " <CR>", opts)
end

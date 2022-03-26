local opts = { noremap = true, silent = true }

local term_opts = { silent = true }

-- Shorten function name
local keymap = vim.api.nvim_set_keymap

--Remap space as leader key
keymap("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Modes
--   normal_mode = "n",
--   insert_mode = "i",
--   visual_mode = "v",
--   visual_block_mode = "x",
--   term_mode = "t",
--   command_mode = "c",

-- Normal --
-- Save and close
keymap("n", "<leader>q", ":q<CR>", opts)
keymap("n", "<leader>w", ":w<CR>", opts)
keymap("n", "<leader>wq", ":wq<CR>", opts)

-- Split navigation
keymap("n", "<leader>sv", ":vsplit<CR>", opts)
keymap("n", "<leader>sh", ":split<CR>", opts)

-- Better window navigation
keymap("n", "<C-h>", "<C-w>h", opts)
keymap("n", "<C-j>", "<C-w>j", opts)
keymap("n", "<C-k>", "<C-w>k", opts)
keymap("n", "<C-l>", "<C-w>l", opts)

-- Resize with arrows
keymap("n", "<C-Up>", ":resize +2<CR>", opts)
keymap("n", "<C-Down>", ":resize -2<CR>", opts)
keymap("n", "<C-Left>", ":vertical resize -2<CR>", opts)
keymap("n", "<C-Right>", ":vertical resize +2<CR>", opts)

-- Navigate buffers
keymap("n", "<S-l>", ":bnext<CR>", opts)
keymap("n", "<S-h>", ":bprevious<CR>", opts)

-- Move text up and down
keymap("n", "<C-k>", "<Esc>:m .-2<CR>==", opts)
keymap("n", "<C-j>", "<Esc>:m .+1<CR>==", opts)

-- Insert --
-- Press jk fast to enter
keymap("i", "<C-Space>", "<ESC>", opts)

-- Visual --
-- Move text up and down
keymap("v", "<C-k>", ":m .-2<CR>==", opts)
keymap("v", "<C-j>", ":m .+1<CR>==", opts)

--Join the next line
keymap("v", "J", "mzJ'z", opts)

--Telescope
keymap ("n","<C-p>", "<cmd>lua require('telescope.builtin').find_files()<cr>", opts)
keymap ("n","<C-g>", "<cmd>lua require('telescope.builtin').live_grep()<cr>", opts)

--Tree
keymap("n", "<leader>n", ":NvimTreeToggle<cr>", opts)

--Format
keymap("n", "<leader>f", ":Format<cr>", opts)
-- Terminal --
-- Better terminal navigation
-- keymap("t", "<C-h>", "<C-\\><C-N><C-w>h", term_opts)
-- keymap("t", "<C-j>", "<C-\\><C-N><C-w>j", term_opts)
-- keymap("t", "<C-k>", "<C-\\><C-N><C-w>k", term_opts)
-- keymap("t", "<C-l>", "<C-\\><C-N><C-w>l", term_opts)

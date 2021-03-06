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
keymap("n", "<C-q>", ":qa<CR>", opts)

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
keymap("n", "<A-j>", ":m .+1<CR>==", opts)
keymap("n", "<A-k>", ":m .-2<CR>==", opts)

--Close Buffers to the right or Left
keymap("n", "<leader>h", ":BufferLineCloseLeft<CR>", opts)
keymap("n", "<leader>l", ":BufferLineCloseRight<CR>", opts)

-- Insert --
-- Press control-space fast to enter
keymap("i", "<C-Space>", "<ESC>", opts)

-- Visual --
-- Move text up and down
keymap("v", "<A-k>", ":m '<-2<CR>gv=gv", opts)
keymap("v", "<A-j>", ":m '>+1<CR>gv=gv", opts)

-- Stay in Visual mode when identing multiple lines
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)
-- Keep last copied item when pasting
keymap("v", "p", '"_dp', opts)

--Telescope
keymap("n", "<C-p>", "<cmd>lua require('telescope.builtin').find_files()<cr>", opts)
-- keymap("n", "<C-p>", "<cmd>lua require('user.telescope').project_files()<cr>", opts)
keymap("n", "<leader>b", "<Cmd>lua require('user.telescope').file_explorer()<CR>", opts)
keymap("n", "<C-g>", "<cmd>lua require('telescope.builtin').live_grep()<cr>", opts)
-- keymap("n", "<C-g>", "<cmd>lua require('user.telescope').my_grep()<cr>", opts)

--Tree
keymap("n", "<leader>n", ":NvimTreeToggle<cr>", opts)

--Format
keymap("n", "<leader>f", ":Format<cr>", opts)

--Open up MARKDOWN Preview
keymap("n", "<leader>m", ":MarkdownPreview<cr>", opts)

--Express shortcut
keymap("i", "<C-x>", "<%=%><Left><Left> <Left> ", opts)

--ConsoleLog Live
keymap("n", "<leader>cl", ":Codi!!<cr>", opts)

-- Terminal --
-- Better terminal navigation
-- keymap("t", "<C-h>", "<C-\\><C-N><C-w>h", term_opts)
-- keymap("t", "<C-j>", "<C-\\><C-N><C-w>j", term_opts)
-- keymap("t", "<C-k>", "<C-\\><C-N><C-w>k", term_opts)
-- keymap("t", "<C-l>", "<C-\\><C-N><C-w>l", term_opts)

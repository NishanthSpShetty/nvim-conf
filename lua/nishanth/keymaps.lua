-- Modes
--   normal_mode = "n",
--   insert_mode = "i",
--   visual_mode = "v",
--   visual_block_mode = "x",
--   term_mode = "t",
--   command_mode = "c",


local opts = { noremap = true, silent = true }

local term_opt = { silent = true }

local keymap = vim.keymap.set

keymap("n", "<C-S>", ":vsp<CR>", opts)
keymap("n", "<C-a>", ":sp<CR>", opts)

-- window command for navigations
keymap("n", "<C-h>", "<C-w>h", opts)
keymap("n", "<C-j>", "<C-w>j", opts)
keymap("n", "<C-k>", "<C-w>k", opts)
keymap("n", "<C-l>", "<C-w>l", opts)


-- enter to insert new line
keymap("n", "<Enter>", "o<ESC>", opts)
-- shift+enter -> create new line above
-- keymap("n", "<S-Enter>", "O<ESC>", opts)

keymap("n", "<up>", ":m .-2<CR>==", opts)
keymap("n", "<down>", ":m .+1<CR>==", opts)

-- Resize with arrows
keymap("n", "<C-Up>", ":resize -2<CR>", opts)
keymap("n", "<C-Down>", ":resize +2<CR>", opts)
keymap("n", "<C-Left>", ":vertical resize +2<CR>", opts)
keymap("n", "<C-Right>", ":vertical resize -2<CR>", opts)

-- Navigate buffers
keymap("n", ",n", ":bnext<CR>", opts)
keymap("n", ",p>", ":bprevious<CR>", opts)

-- Move text up and down
keymap("v", "<A-j>", ":m '>+1<CR>gv=gv", opts)
keymap("v", "<A-k>", ":m '<-2<CR>gv=gv", opts)

-- Visual Block --
-- Move text up and down
keymap("x", "<A-j>", ":m '>+1<CR>gv=gv", opts)
keymap("x", "<A-k>", ":m '<-2<CR>gv=gv", opts)

keymap("v", "p", '"_dP', opts)
keymap("n", "<leader><leader>x", ':source %<CR>', opts)
keymap("n", "<leader><leader>t", '<Plug>PlenaryTestFile', opts)

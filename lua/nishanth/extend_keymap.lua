local opts = {noremap = true, silent =  true }

local term_opt = { silent = true }

local keymap = vim.keymap.set

local builtin = require('telescope.builtin')

keymap('n', '<C-p>', builtin.find_files, { desc = 'Telescope find files' })
keymap('n', '<leader>ff', builtin.find_files, { desc = 'Telescope find files' })


keymap('n', '<leader>fs', builtin.current_buffer_fuzzy_find, { desc = 'Telescope current buffer fuzzy find' })
keymap('n', '<leader>ff', builtin.find_files, { desc = 'Telescope find files' })
keymap('n', '<leader>fg', builtin.live_grep, { desc = 'Telescope live grep' })
keymap('n', '<leader>fb', builtin.buffers, { desc = 'Telescope buffers' })
keymap('n', '<leader>fh', builtin.help_tags, { desc = 'Telescope help tags' })

keymap("n", "<leader>t", ":NvimTreeToggle<CR>", opts)
keymap("n", "<leader>nf", ":NvimTreeFindFile<CR>", opts)
keymap("n", "<leader>r", ":NvimTreeRefresh<CR>", opts)

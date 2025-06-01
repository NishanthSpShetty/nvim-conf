local opts = { noremap = true, silent = true }

local term_opt = { silent = true }

local keymap = vim.keymap.set

local builtin = require('telescope.builtin')
local find_files = function()
    builtin.find_files({ path_display = { 'shorten' }, layout_strategy = 'vertical', layout_config = { width = 0.6 } })
end

keymap('n', '<C-p>', builtin.find_files, { desc = 'Telescope find files' })
keymap('n', '<C-f>', find_files, { desc = 'Telescope find files' })


keymap('n', '<leader>fs', builtin.current_buffer_fuzzy_find, { desc = 'Telescope current buffer fuzzy find' })
keymap('n', '<leader>ff', builtin.find_files, { desc = 'Telescope find files' })
keymap('n', '<leader>fg', builtin.live_grep, { desc = 'Telescope live grep' })
keymap('n', '<leader>fb', builtin.buffers, { desc = 'Telescope buffers' })
keymap('n', '<leader>fh', builtin.help_tags, { desc = 'Telescope help tags' })

keymap("n", "<leader>t", ":NvimTreeToggle<CR>", opts)
keymap("n", "<leader>nf", ":NvimTreeFindFile<CR>", opts)
keymap("n", "<leader>r", ":NvimTreeRefresh<CR>", opts)

-- vim fugive
keymap("n", "<leader>gc", ":GCheckout<CR>", opts)
keymap("n", "<leader>gs", ":G<CR>", opts)


keymap("n", "<leader>jt", require('jdtls').test_class, opts)
keymap("n", "<leader>jnt", require('jdtls').test_nearest_method, opts)


local neotest_runner = require("neotest").run

local neo_debug = function()
    neotest_runner.run({ strategy = "dap" })
end

keymap("n", "<leader>nt", neotest_runner.run, opts)
keymap("n", "<leader>nd", neo_debug, opts)

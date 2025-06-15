local opts = { noremap = true, silent = true }
local keymap = vim.keymap.set

require("neotest").setup({
    summary = {
        open = "botright vsplit | vertical resize 80",
    },
    adapters = {
        require("neotest-rust"), -- needs to run cargo install cargo-nexttest
        require("neotest-go"),
        require("neotest-java")({
            -- config here
        }),
        require("neotest-vim-test")({
            ignore_file_types = { "python", "vim", "lua", "rust", "go", "java" },
        }),
        require("neotest-zig")({
            dap = {
                adapter = "lldb",
            }
        }),
    }
})


local neotest = require("neotest");
local neotest_runner = neotest.run

local neo_debug = function()
    neotest_runner.run({ strategy = "dap" })
end

local neo_run_all = function()
    neotest_runner.run({ suite = true })
end

keymap("n", "<leader>nt", neotest_runner.run, opts)
keymap("n", "<leader>nr", neotest_runner.run, opts)
keymap("n", "<leader>ns", neotest_runner.stop, opts)
keymap("n", "<leader>na", neo_run_all, opts)
keymap("n", "<leader>np", neotest.output_panel.toggle, opts)
keymap("n", "<leader>no", neotest.output_panel.open, opts)
keymap("n", "<leader>nv", neotest.summary.toggle, opts)
keymap("n", "<leader>nd", neo_debug, opts)

require "nishanth.options"
require "nishanth.keymaps"
require "nishanth.lazy"

vim.o.background = "dark" -- or "light" for light mode

vim.cmd([[colorscheme gruvbox]])
vim.diagnostic.config({
    virtual_text = true,
    signs = {
        text = {
            [vim.diagnostic.severity.ERROR] = '󰅚 ',
            [vim.diagnostic.severity.WARN] = '󰀪 ',
            [vim.diagnostic.severity.INFO] = '󰋽 ',
            [vim.diagnostic.severity.HINT] = '󰌶 ',
        },
    },
    underline = { severity = vim.diagnostic.severity.ERROR },
})




require "nishanth.treesitter"
require "nishanth.dap"
require "nishanth.neotest"
require "nishanth.globals"

  require('lualine').setup {}


require("dap-python").setup("python3")

-- if using nvim-java require('java').setup()
require('dap-go').setup()



require "nishanth.extend_keymap"
require 'nishanth.neotree'

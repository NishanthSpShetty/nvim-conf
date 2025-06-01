require "nishanth.options"
require "nishanth.keymaps"
require "nishanth.lazy"

vim.o.background = "dark" -- or "light" for light mode

vim.cmd([[colorscheme gruvbox]])
--vim.g.diagnostics_virtual_text = {
--    style = "end", -- end of line
--    -- style = "current", -- only display for the current line
--}
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
    --    severity_sort = true,
    --    virtual_lines = {
    --
    --        current_line = true,
    --        source = 'if_many',
    --        spacing = 2,
    --        format = function(diagnostic)
    --            local diagnostic_message = {
    --                [vim.diagnostic.severity.ERROR] = diagnostic.message,
    --                [vim.diagnostic.severity.WARN] = diagnostic.message,
    --                [vim.diagnostic.severity.INFO] = diagnostic.message,
    --                [vim.diagnostic.severity.HINT] = diagnostic.message,
    --            }
    --            return diagnostic_message[diagnostic.severity]
    --        end,
    --    },
    underline = { severity = vim.diagnostic.severity.ERROR },
})




require "nishanth.treesitter"
require "nishanth.dap"
require "nishanth.neotest"

require('lualine').setup {}

--

local function open_nvim_tree()
    -- open the tree
    require("nvim-tree.api").tree.open()
end

vim.api.nvim_create_autocmd({ "VimEnter" }, { callback = open_nvim_tree })

require("dap-python").setup("python3")

-- if using nvim-java require('java').setup()
require('dap-go').setup()



require "nishanth.extend_keymap"

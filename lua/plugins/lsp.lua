return {
    {
        "neovim/nvim-lspconfig",
        dependencies = {
            {
                "folke/lazydev.nvim",
                ft = "lua", -- only load on lua files
                opts = {
                    library = {
                        -- See the configuration section for more details
                        -- Load luvit types when the `vim.uv` word is found
                        { path = "${3rd}/luv/library", words = { "vim%.uv" } },
                    },
                },
            },
            { 'saghen/blink.cmp' },

        },
        opts = {
            servers = {
                lua_ls = {},
                pyright = {},
                ts_ls = {},
                gopls = {},
                clangd = {},
                ocamllsp = {},
                zls = {},
                julials = {},
                rust_analyzer = {},

            }
            -- if using nvim-java                jdtls = -- {},
        },
        config = function(_, opts)
            local lspconfig = require('lspconfig')


            for server, config in pairs(opts.servers) do
                -- passing config.capabilities to blink.cmp merges with the capabilities in your
                -- `opts[server].capabilities, if you've defined it
                --                config.capabilities = require('blink.cmp').get_lsp_capabilities(config.capabilities)
                lspconfig[server].setup(config)
            end

            vim.api.nvim_create_autocmd('LspAttach', {
                group = vim.api.nvim_create_augroup('my.lsp', {}),
                callback = function(event)
                    local client = assert(vim.lsp.get_client_by_id(event.data.client_id))

                    if not client then return end


                    local augroup = vim.api.nvim_create_augroup('my.lsp', { clear = false })

                    -- Auto-format ("lint") on save.
                    -- Usually not needed if server supports "textDocument/willSaveWaitUntil".
                    if not client:supports_method('textDocument/willSaveWaitUntil')
                        and client:supports_method('textDocument/formatting') then
                        vim.api.nvim_create_autocmd('BufWritePre', {
                            group = augroup,
                            buffer = event.buf,
                            callback = function()
                                vim.lsp.buf.format({ bufnr = event.buf, id = client.id, timeout_ms = 1000 })
                            end,
                        })
                    end




                    local map = function(keys, func, desc, mode)
                        mode = mode or 'n'
                        vim.keymap.set(mode, keys, func, { buffer = event.buf, desc = 'LSP: ' .. desc })
                    end

                    -- Rename the variable under your cursor.
                    --  Most Language Servers support renaming across files, etc.
                    -- map('<leader>rn', vim.lsp.buf.rename, '[R]e[n]ame')


                    -- Execute a code action, usually your cursor needs to be on top of an error
                    -- or a suggestion from your LSP for this to activate.
                    --                    map('<space>ca', vim.lsp.buf.code_action, '[G]oto Code [A]ction', { 'n', 'x' })

                    -- Find references for the word under your cursor.
                    map('gr', function()
                        require('telescope.builtin').lsp_references { fname_width = 100 }
                    end, '[G]oto [R]eferences')

                    -- Jump to the implementation of the word under your cursor.
                    --  Useful when your language has ways of declaring types without an actual implementation.
                    map('gi', require('telescope.builtin').lsp_implementations, '[G]oto [I]mplementation')

                    -- Jump to the definition of the word under your cursor.
                    --  This is where a variable was first declared, or where a function is defined, etc.
                    --  To jump back, press <C-t>.
                    map('gd', require('telescope.builtin').lsp_definitions, '[G]oto [D]efinition')

                    -- WARN: This is not Goto Definition, this is Goto Declaration.
                    --  For example, in C this would take you to the header.
                    map('gD', vim.lsp.buf.declaration, '[G]oto [D]eclaration')

                    -- Fuzzy find all the symbols in your current document.
                    --  Symbols are things like variables, functions, types, etc.
                    map('gO', require('telescope.builtin').lsp_document_symbols, 'Open Document Symbols')

                    -- Fuzzy find all the symbols in your current workspace.
                    --  Similar to document symbols, except searches over your entire project.
                    map('gW', require('telescope.builtin').lsp_dynamic_workspace_symbols, 'Open Workspace Symbols')

                    -- Jump to the type of the word under your cursor.
                    --  Useful when you're not sure what type a variable is and you want to see
                    --  the definition of its *type*, not where it was *defined*.
                    map('gt', require('telescope.builtin').lsp_type_definitions, '[G]oto [T]ype Definition')


                    map('U', ':Lspsaga hover_doc<CR>', 'Hover definition')
                    map('<leader>rn', '<cmd>Lspsaga rename<CR>', 'Rename')
                    map('<leader>o', '<cmd>Lspsaga outline<CR>', 'Outline')
                    map('<space>ca', '<cmd>Lspsaga code_action<CR>', '[G]oto Code [A]ction', { 'n', 'x' })
                    map('<space>lr', '<cmd>Lspsaga finder ref<CR>', 'References')
                    map('<space>ld', '<cmd>Lspsaga finder def<CR>', 'Definition')
                    map('<space>d', '<cmd>Lspsaga show_buf_diagnostics<CR>', 'Definition')
                    map('[d', '<cmd>Lspsaga diagnostic_jump_prev<CR>', 'Definition')
                    map(']d', '<cmd>Lspsaga diagnostic_jump_next<CR>', 'Definition')


                    if client:supports_method('textDocument/documentHighlight') then
                        vim.api.nvim_create_autocmd({ 'CursorHold', 'CursorHoldI' }, {
                            buffer = event.buf,
                            group = augroup,
                            callback = vim.lsp.buf.document_highlight,
                        })

                        vim.api.nvim_create_autocmd({ 'CursorMoved', 'CursorMovedI' }, {
                            buffer = event.buf,
                            group = augroup,
                            callback = vim.lsp.buf.clear_references,
                        })
                    end
                    -- end of callback
                end,
            })
        end,
    }
}

-- A list of parser names, or "all" (the listed parsers MUST always be installed)
--local ensure_installed = { "c", "go", "rust", "python", "lua", "vim", "vimdoc", "query", "markdown", "markdown_inline",
--    "java" }
require('nvim-treesitter.config').setup({

    highlight = {
        enable = true,
           additional_vim_regex_highlighting = {"go"},
    },
})

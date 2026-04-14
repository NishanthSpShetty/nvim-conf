return {
    { "ellisonleao/gruvbox.nvim",        priority = 1000, config = true,      opts = ... },
    { "folke/tokyonight.nvim",           lazy = false,    priority = 1000,    opts = {} },
    --colorscheme { "EdenEast/nightfox.nvim" },
    { "nvim-treesitter/nvim-treesitter", branch='main', lazy = false,    build = ":TSUpdate" },
    { "tpope/vim-fugitive" },
    { "mfussenegger/nvim-jdtls" },
    --{
    --    'nvim-java/nvim-java',

    --    config = function()
    --        require('java').setup()
    --    end,
    --},
    { 'mfussenegger/nvim-dap' },
    -- Jumps to the last exited location in files.
    { "farmergreg/vim-lastplace" },
    --    { dir = "~/programs/nplugs/stackmap.nvim", dev = true }

    {
    "rachartier/tiny-inline-diagnostic.nvim",
    event = "VeryLazy",
    priority = 1000,
    config = function()
        require("tiny-inline-diagnostic").setup()
        vim.diagnostic.config({ virtual_text = false }) -- Disable Neovim's default virtual text diagnostics
    end,
},
{ "saecki/live-rename.nvim" }
}

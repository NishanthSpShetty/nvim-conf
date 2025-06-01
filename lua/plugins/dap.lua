return {

    {
        'mfussenegger/nvim-dap',
        lazy = true,
        keys = {
            {
                "<leader>b",
                function() require("dap").toggle_breakpoint() end,
                desc = "Toggle Breakpoint"
            },

            {
                "<leader>dc",
                function()
                    require("dap").continue()
                end,
                desc = "Continue"
            },

            {
                "<F5>",
                function()
                    require("dap").continue()
                end,
                desc = "Continue"
            },

            {
                "<F10>",
                function() require("dap").step_over() end,
                desc = "Step over"
            },

            {
                "<F11>",
                function() require("dap").step_into() end,
                desc = "Step into"
            },

            {
                "<leader>dC",
                function() require("dap").run_to_cursor() end,
                desc = "Run to Cursor"
            },

            {
                "<leader>dT",
                function()
                    require("dap").terminate()
                end,
                desc = "Terminate"
            },
        },
    },
    {
        "jay-babu/mason-nvim-dap.nvim",
        -- @type MasonNvimDapSettings
        opts = {
            -- This line is essential to making automatic installation work
            -- :exploding-brain
            handlers = {},
            automatic_installation = {
                -- These will be configured by separate plugins.
                exclude = {
                    "delve",
                    "python",
                    "java",
                },
            },
            -- DAP servers: Mason will be invoked to install these if necessary.
            ensure_installed = {
                "bash",
                "codelldb",
                "python",
            },
        },
        dependencies = {
            "mfussenegger/nvim-dap",
            "williamboman/mason.nvim",
        },
    },

    -----------------------------------------------------------------------------------------------------
    -- dap ui configration
    -----------------------------------------------------------------------------------------------------

    {
        "theHamsta/nvim-dap-virtual-text",
        config = true,
        dependencies = {
            "mfussenegger/nvim-dap",
        },
    },
    {
        "rcarriga/nvim-dap-ui",
        config = true,

        keys = {
            {
                "<leader>du",
                function()
                    -- close nvim tree when opening debugger view
                    require("nvim-tree.api").tree.close()
                    require("dapui").toggle({})
                end,
                desc = "Dap UI"
            },
        },
        dependencies = {
            "nvim-neotest/nvim-nio",
        },
    },

    -----------------------------------------------------------------------------------------------------
    -- Python dap configration
    -----------------------------------------------------------------------------------------------------
    {
        "mfussenegger/nvim-dap-python",
    },

    -----------------------------------------------------------------------------------------------------
    -- Golang dap configration
    -----------------------------------------------------------------------------------------------------
    {
        "leoluz/nvim-dap-go",
        config = true,
        dependencies = {
            "mfussenegger/nvim-dap",
        },
        keys = {
            {
                "<leader>dt",
                function() require('dap-go').debug_test() end,
                desc = "Debug test"
            },
        },
    },

}

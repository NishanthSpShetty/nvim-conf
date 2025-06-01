-- C/C++/Rust DAP configuration
--
--
local dap = require("dap")
local function get_lldb(mac)
    local lldb = {
        type = "executable",
        name = "lldb",
    }

    if mac == 1 then
        lldb.command = "/Users/nishanth/.vscode/extensions/lanza.lldb-vscode-0.2.3/bin/darwin/bin/lldb-vscode"
    else
        lldb.command = "/usr/bin/lldb-vscode-15"
    end

    return lldb
end

dap.adapters.lldb = get_lldb(vim.fn.has("macunix"))

dap.configurations.cpp = {
    {
        name = "Launch",
        type = "lldb",
        request = "launch",
        program = function()
            return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/target/debug/", "file")
        end,
        cwd = "${workspaceFolder}",
        stopOnEntry = false,
        args = {},

        -- 💀
        -- if you change `runInTerminal` to true, you might need to change the yama/ptrace_scope setting:
        --
        --    echo 0 | sudo tee /proc/sys/kernel/yama/ptrace_scope
        --
        -- Otherwise you might get the following error:
        --
        --    Error on launch: Failed to attach to the target process
        --
        -- But you should be aware of the implications:
        -- https://www.kernel.org/doc/html/latest/admin-guide/LSM/Yama.html
        -- runInTerminal = false,
    },
}

--  use the cpp config for both C and Rust
dap.configurations.c = dap.configurations.cpp
dap.configurations.rust = dap.configurations.cpp

vim.fn.sign_define("DapBreakpoint", { text = "⬢", texthl = "Yellow", linehl = "", numhl = "Yellow" })
vim.fn.sign_define("DapStopped", { text = "▶", texthl = "Green", linehl = "ColorColumn", numhl = "Green" })

local ui = require('dapui')

-- close nvim tree on dap UI open and open nvmtree on dap-ui close
dap.listeners.before.attach.dapui_config = function()
    require("nvim-tree.api").tree.close()
    ui.open()
end

dap.listeners.before.launch.dapui_config = function()
    require("nvim-tree.api").tree.close()
    ui.open()
end

dap.listeners.before.event_terminated.dapui_config = function()
    ui.close()
    require("nvim-tree.api").tree.toggle(false, true)
end

dap.listeners.before.event_exited.dapui_config = function()
    ui.close()
    -- open it but dont keep the focus on the TreeView
    require("nvim-tree.api").tree.toggle(false, true)
    --require("nvim-tree.api").tree.open({ focus = false })
end

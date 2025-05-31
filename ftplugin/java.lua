local opts = { noremap = true, silent = true }

local keymap = vim.keymap.set

keymap("n", "<leader>jt", require('jdtls').test_class, opts)
keymap("n", "<leader>jnt", require('jdtls').test_nearest_method, opts)
-- keymap("n", "<F5>", require('jdtls').test_nearest_method, opts)


local config = {
    -- running jdtls from https://download.eclipse.org/jdtls/milestones/1.47.0/
    cmd = { 'jdtls' },
    root_dir = vim.fs.dirname(vim.fs.find({ 'gradlew', '.git', 'mvnw' }, { upward = true })[1]),
}

local bundles = {
    vim.fn.glob("~/.config/nvim/resource/com.microsoft.java.debug.plugin-*.jar", true)
};

local vscode_java_test = vim.fn.glob("~/.config/nvim/resource/java-test-server/*.jar", true)
vim.list_extend(bundles, vim.split(vscode_java_test, '\n')
)

config['init_options'] = {
    bundles = bundles,
}
require('jdtls').start_or_attach(config)

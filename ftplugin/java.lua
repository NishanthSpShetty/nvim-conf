local config = {
    -- running jdtls from https://download.eclipse.org/jdtls/milestones/1.47.0/
    cmd = { '/home/nishanth/installs/jdtls/bin/jdtls' },
    root_dir = vim.fs.dirname(vim.fs.find({ 'gradlew', '.git', 'mvnw' }, { upward = true })[1]),
}
require('jdtls').start_or_attach(config)

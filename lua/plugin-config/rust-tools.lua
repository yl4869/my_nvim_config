local status, rust_tools = pcall(require, "rust-tools")
if not status then 
    vim.notify("需要 tust-tools")
    return 
end
require('rust-tools').setup({})

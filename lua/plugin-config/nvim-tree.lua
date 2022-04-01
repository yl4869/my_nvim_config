local status, nvim_tree = pcall(require, "nvim-tree")
if not status then
    vim.notify("没有找到 nvim-tree")
    return 
end

local list_keys = require('keybindings').nvimTreeList

nvim_tree.setup( {
    update_cwd = true,
    update_focused_file = {
        enable = true,
        update_cwd = true
    },
})

--自动关闭
vim.cmd([[
  autocmd BufEnter * ++nested if winnr('$') == 1 && bufname() == 'NvimTree_' . tabpagenr() | quit | endif
]])


local status, nvim_autopairs = pcall(require, "nvim-autopairs")
if not status then 
    vim.notify("需要 nvim-autopairs")
    return 
end 

nvim_autopairs.setup({
})

local status, project = pcall(require, "project_nvim")
if not status then 
    vim.notify("没有找到 project_nvim")
end 

project.setup({
})

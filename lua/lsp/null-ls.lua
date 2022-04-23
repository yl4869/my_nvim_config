local status, null_ls = pcall(require, "null-ls")
if not status then
	vim.notify("没有找到 notify")
	return
end

null_ls.setup({
	sources = {
		null_ls.builtins.formatting.stylua,
	},
})

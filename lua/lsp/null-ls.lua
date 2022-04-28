local status, null_ls = pcall(require, "null-ls")
if not status then
	vim.notify("没有找到 notify")
	return
end

null_ls.setup({
	debug = false,
	sources = {
		null_ls.builtins.formatting.stylua,
		null_ls.builtins.formatting.rustfmt,
		null_ls.builtins.diagnostics.eslint,
	},
})

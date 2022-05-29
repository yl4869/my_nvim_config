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
		null_ls.builtins.formatting.clang_format,
		-- null_ls.builtins.diagnostics.eslint,
	},
	on_attach = function(client)
		-- if client.resolved_capabilities.document_formatting then
		--	vim.cmd("autocmd BufWritePre <buffer> lua vim.lsp.buf.formatting_sync()")
		--end
	end,
})

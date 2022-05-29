local lsp_formatting = function(bufnr)
	vim.lsp.buf.format({
		filter = function(client)
			-- apply whatever logic you want (in this example, we'll only use null-ls)
			return client.name == "null-ls"
		end,
		bufnr = bufnr,
	})
end

local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

local opts = {
	capabilities = require("cmp_nvim_lsp").update_capabilities(vim.lsp.protocol.make_client_capabilities()),
	flags = {
		debounce_text_changes = 150,
	},
	on_attach = function(client, bufnr)
		if client.supports_method("textDocument/formatting") then
			vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
			vim.api.nvim_create_autocmd("BufWritePre", {
				group = augroup,
				buffer = bufnr,
				callback = function()
					lsp_formatting(bufnr)
				end,
			})
		end

		local function buf_set_keymap(...)
			vim.api.nvim_buf_set_keymap(bufnr, ...)
		end

		require("keybindings").mapLSP(buf_set_keymap)
	end,
}
return {
	on_setup = function(server)
		--if client.supports_method("textDocument/formatting") then
		--	vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
		--	vim.api.nvim_create_autocmd("BufWritePre", {
		--		group = augroup,
		--		buffer = bufnr,
		--		callback = function()
		--			lsp_formatting(bufnr)
		--		end,
		--	})
		--end
		require("rust-tools").setup({
			server = vim.tbl_deep_extend("force", server:get_default_options(), opts),
		})
		--server:attach_buffers()
		--require("rust-tools").start_standalone_if_required()
	end,
}

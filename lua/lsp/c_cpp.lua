local runtime_path = vim.split(package.path, ";")
table.insert(runtime_path, "lua/?.lua")
table.insert(runtime_path, "lua/?/init.lua")

local opts = {
	on_attach = function(client, bufnr)
		client.resolved_capabilities.document_formatting = false
		client.resolved_capabilities.document_range_formatting = false

		local function buf_set_keymap(...)
			vim.api.nvim_buf_set_keymap(bufnr, ...)
		end

		require("keybindings").mapLSP(buf_set_keymap)

		vim.cmd("auto BufWritePre <buffer> lua vim.lsp.buf.formatting_sync()")
	end,
}

return {
	on_setup = function(server)
		server:setup(opts)
	end,
}

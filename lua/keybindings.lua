-- 映射leader为空格

vim.g.mapleader = " "
vim.g.maplocalleader = " "
-- 设置映射本地变量快捷键
local map = vim.api.nvim_set_keymap
local opt = { noremap = true, silent = true }

-- 映射快速保存和退出 map("n","<leader>w", ":w<CR>",opt)
map("n", "<leader>w", ":w<CR>", opt)
map("n", "<leader>q", ":w<CR>:bd<CR>", opt)
map("n", "<leader>a", ":wqa<CR>", opt)

-- ctrl+u/ctrl+d移动9行
map("n", "<C-u>", "9k", opt)
map("n", "<C-d>", "9j", opt)

-- visual 模式下可以连续 > 缩进代码
map("v", "<", "<gv", opt)
map("v", ">", ">gv", opt)

-- 分屏
map("n", "sv", ":vsp<CR>", opt)
map("n", "sh", ":sp<CR>", opt) -- 关闭当前
map("n", "sc", "<C-w>c", opt)
--关闭其他
map("n", "so", "<C-w>o", opt) -- close others

-- 比例控制（不常用，因为支持鼠标拖拽）
map("n", "s>", ":vertical resize +20<CR>", opt)
map("n", "s<", ":vertical resize -20<CR>", opt)
map("n", "s=", "<C-w>=", opt)
map("n", "sj", ":resize +10<CR>", opt)
map("n", "sk", ":resize -10<CR>", opt)

-- 窗口跳转
map("n", "<A-h>", "<C-w>h", opt)
map("n", "<A-j>", "<C-w>j", opt)
map("n", "<A-k>", "<C-w>k", opt)
map("n", "<A-l>", "<C-w>l", opt)

-- nvim-tree
map("n", "tt", ":NvimTreeToggle<CR>", opt)

-- bufferline 窗口切换
map("n", "<leader>h", ":BufferLineCyclePrev<CR>", opt)
map("n", "<leader>l", ":BufferLineCycleNext<CR>", opt)

-- 关闭
--"moll/vim-bbye"
map("n", "<leader>d", ":Bdelete!<CR>", opt)
map("n", "<leader>bl", ":BufferLineCloseRight<CR>", opt)
map("n", "<leader>bh", ":BufferLineCloseLeft<CR>", opt)
map("n", "<leader>bc", ":BufferLinePickClose<CR>", opt)

-- nvim-treesitter 代码格式化
map("n", "<leader>i", "gg=G", opt)

-- Telescope
map("n", "<C-f>", ":Telescope find_files<CR>", opt)
-- map("n", "<leader>f", ":Telescope find_files<CR>", opt)
map("n", "<C-p>", ":Telescope live_grep<CR>", opt)

-- 终端相关
map("n", "<leader>t", ":sp | terminal<CR>", opt)
map("n", "<leader>vt", ":vsp | terminal<CR>", opt)
map("t", "<Esc>", "<C-\\><C-n>", opt)
map("t", "<A-h>", [[ <C-\><C-N><C-w>h ]], opt)
map("t", "<A-j>", [[ <C-\><C-N><C-w>j ]], opt)
map("t", "<A-k>", [[ <C-\><C-N><C-w>k ]], opt)
map("t", "<A-l>", [[ <C-\><C-N><C-w>l ]], opt)

local pluginKeys = {}

pluginKeys.nvimTreeList = {
	-- 打开文件或文件夹
	{ key = { "<CR>", "o", "<2-LeftMouse>" }, action = "edit" },
	-- 分屏打开文件
	{ key = "v", action = "vsplit" },
	{ key = "h", action = "split" },
	-- 显示隐藏文件
	{ key = "i", action = "toggle_ignored" }, -- Ignore (node_modules)
	{ key = ".", action = "toggle_dotfiles" }, -- Hide (dotfiles)
	-- 文件操作
	{ key = "R", action = "refresh" },
	{ key = "a", action = "create" },
	{ key = "d", action = "remove" },
	{ key = "r", action = "rename" },
	{ key = "x", action = "cut" },
	{ key = "c", action = "copy" },
	{ key = "p", action = "paste" },
	{ key = "s", action = "system_open" },
}

-- lsp 回调函数快捷键设置
pluginKeys.mapLSP = function(mapbuf)
	-- rename
	-- mapbuf("n", "<leader>rn", "<cmd>lua vim.lsp.buf.rename()<CR>", opt)
	mapbuf("n", "<leader>rn", "<cmd>Lspsaga rename<CR>", opt)
	-- code action
	-- mapbuf("n", "<space>ca", "<cmd>lua vim.lsp.buf.code_action()<CR>", opt)
	mapbuf("n", "<leader>ca", "<cmd>Lspsaga code_action<CR>", opt)
	-- go xx
	mapbuf("n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", opt)
	-- mapbuf("n", "gh", "<cmd>lua vim.lsp.buf.hover()<CR>", opt)
	mapbuf("n", "gh", "<cmd>Lspsaga hover_doc<CR>", opt)
	mapbuf("n", "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>", opt)
	--mapbuf("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", opt)
	--mapbuf("n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>", opt)
	mapbuf("n", "gr", "<cmd>Lspsaga lsp_finder<CR>", opt)
	-- diagnostic
	--mapbuf("n", "gp", "<cmd>lua vim.diagnostic.open_float()<CR>", opt)
	--mapbuf("n", "gj", "<cmd>lua vim.diagnostic.goto_prev()<CR>", opt)
	--mapbuf("n", "gk", "<cmd>lua vim.diagnostic.goto_next()<CR>", opt)
	mapbuf("n", "gp", "<cmd>Lspsaga show_line_diagnostics<CR>", opt)
	mapbuf("n", "gj", "<cmd>Lspsaga diagnostic.jump.next<cr>", opt)
	mapbuf("n", "gk", "<cmd>Lspsaga diagnostic.jump.prev<cr>", opt)
	-- mapbuf('n', '<leader>q', '<cmd>lua vim.diagnostic.setloclist()<CR>', opt)
	-- leader + =
	mapbuf("n", "<leader>=", "<cmd>lua vim.lsp.buf.formatting()<CR>", opt)
	-- mapbuf('n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opt)
	-- mapbuf('n', '<space>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opt)
	-- mapbuf('n', '<space>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opt)
	-- mapbuf('n', '<space>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opt)
	-- mapbuf('n', '<space>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opt)
end

-- nvim-cmp 自动补全
pluginKeys.cmp = function(cmp)
	local feedkey = function(key, mode)
		vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes(key, true, true, true), mode, true)
	end

	local has_words_before = function()
		local line, col = unpack(vim.api.nvim_win_get_cursor(0))
		return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
	end

	return {
		-- 上一个
		["<C-k>"] = cmp.mapping.select_prev_item(),
		-- 下一个
		["<C-j>"] = cmp.mapping.select_next_item(),

		--["<tab>"] = cmp.mapping.select_next_item(),
		-- 出现补全
		["<A-.>"] = cmp.mapping(cmp.mapping.complete(), { "i", "c" }),
		-- 取消
		["<A-,>"] = cmp.mapping({
			i = cmp.mapping.abort(),
			c = cmp.mapping.close(),
		}),
		-- 确认
		-- Accept currently selected item. If none selected, `select` first item.
		-- Set `select` to `false` to only confirm explicitly selected items.
		["<CR>"] = cmp.mapping.confirm({
			select = true,
			behavior = cmp.ConfirmBehavior.Replace,
		}),
		-- ['<C-y>'] = cmp.config.disable, -- Specify `cmp.config.disable` if you want to remove the default `<C-y>` mapping.
		["<C-u>"] = cmp.mapping(cmp.mapping.scroll_docs(-4), { "i", "c" }),
		["<C-d>"] = cmp.mapping(cmp.mapping.scroll_docs(4), { "i", "c" }),

		-- 自定义代码段跳转到下一个参数
		["<C-l>"] = cmp.mapping(function(_)
			if vim.fn["vsnip#available"](1) == 1 then
				feedkey("<Plug>(vsnip-expand-or-jump)", "")
			end
		end, { "i", "s" }),

		-- 自定义代码段跳转到上一个参数
		["<C-h>"] = cmp.mapping(function()
			if vim.fn["vsnip#jumpable"](-1) == 1 then
				feedkey("<Plug>(vsnip-jump-prev)", "")
			end
		end, { "i", "s" }),

		-- Super Tab
		--["<Tab>"] = cmp.mapping(function(fallback)
		--    if cmp.visible() then
		--        cmp.select_next_item()
		--    elseif vim.fn["vsnip#available"](1) == 1 then
		--        feedkey("<Plug>(vsnip-expand-or-jump)", "")
		--    elseif has_words_before() then
		--        cmp.complete()
		--    else
		--        fallback() -- The fallback function sends a already mapped key. In this case, it's probably `<Tab>`.
		--    end
		--end, {"i", "s"}),

		--["<S-Tab>"] = cmp.mapping(function()
		--    if cmp.visible() then
		--        cmp.select_prev_item()
		--    elseif vim.fn["vsnip#jumpable"](-1) == 1 then
		--        feedkey("<Plug>(vsnip-jump-prev)", "")
		--    end
		--end, {"i", "s"})
		-- end of super Tab
	}
end
return pluginKeys

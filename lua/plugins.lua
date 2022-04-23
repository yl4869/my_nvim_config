return require("packer").startup(function()
	use("wbthomason/packer.nvim") --插件管理插件
	-- 皮肤配色
	use("glepnir/zephyr-nvim")
	use("folke/tokyonight.nvim")

	-- bufferline
	use({
		"akinsho/bufferline.nvim",
		requires = "kyazdani42/nvim-web-devicons",
		requires = "moll/vim-bbye",
	})

	-- lualine
	use({
		"nvim-lualine/lualine.nvim",
		requires = { "kyazdani42/nvim-web-devicons", opt = true },
	})

	-- telescope 模糊搜索
	use({
		"nvim-telescope/telescope.nvim",
		requires = "nvim-lua/plenary.nvim",
	})
	--启动页
	use({
		"goolord/alpha-nvim",
		require("alpha").setup(require("alpha.themes.dashboard").config),
	})
	-- project
	use("ahmedkhalf/project.nvim")

	-- 代码高亮
	use({ "nvim-treesitter/nvim-treesitter", run = ":TSUpdate" })

	-- lsp配置
	use("neovim/nvim-lspconfig") -- Collection of configurations for the built-in LSP client
	use("williamboman/nvim-lsp-installer") --language Server 安装器

	-- nvim-cmp
	use("hrsh7th/nvim-cmp")
	use("hrsh7th/cmp-nvim-lsp") -- { name = nvim_lsp }
	use("hrsh7th/cmp-buffer") -- { name = 'buffer' },
	use("hrsh7th/cmp-path") -- { name = 'path' }
	use("hrsh7th/cmp-cmdline") -- { name = 'cmdline' }

	-- vsnip
	use("hrsh7th/cmp-vsnip") -- { name = 'vsnip' }
	use("hrsh7th/vim-vsnip")
	use("rafamadriz/friendly-snippets")

	-- lspkind
	use("onsails/lspkind-nvim")

	use("simrat39/rust-tools.nvim")

	-- 符号自动补全
	use("windwp/nvim-autopairs")

	use("nvim-lua/plenary.nvim")
	use("mfussenegger/nvim-dap")
	use("ellisonleao/glow.nvim")
	use("kyazdani42/nvim-web-devicons")

	-- nvim-tree 插件
	use({
		"kyazdani42/nvim-tree.lua",
		requires = {
			"kyazdani42/nvim-web-devicons", -- optional, for file icon
		},
	})

	use("davidgranstrom/nvim-markdown-preview")

	-- 彩虹括号
	use("p00f/nvim-ts-rainbow")

	--easy motion
	use("easymotion/vim-easymotion")

	--indent-blankline
	use("lukas-reineke/indent-blankline.nvim")

	use({ "jose-elias-alvarez/null-ls.nvim", requires = "nvim-lua/plenary.nvim" })
	use({ "tami5/lspsaga.nvim" }) -- nightly
	use({ "tami5/lspsaga.nvim", branch = "nvim6.0" or "nvim51" }) -- for specific version
end)

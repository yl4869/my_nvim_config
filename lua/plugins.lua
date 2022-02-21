return require('packer').startup(function()
    use 'wbthomason/packer.nvim'
    use 'glepnir/zephyr-nvim'
    use {'akinsho/bufferline.nvim', requires = 'kyazdani42/nvim-web-devicons'}
    use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }
    use 'neovim/nvim-lspconfig' -- Collection of configurations for the built-in LSP client
    use 'williamboman/nvim-lsp-installer'
    -- nvim-cmp
    use 'hrsh7th/cmp-nvim-lsp' -- { name = nvim_lsp }
    use 'hrsh7th/cmp-buffer'   -- { name = 'buffer' },
    use 'hrsh7th/cmp-path'     -- { name = 'path' }
    use 'hrsh7th/cmp-cmdline'  -- { name = 'cmdline' }
    use 'hrsh7th/nvim-cmp'
    -- vsnip
    use 'hrsh7th/cmp-vsnip'    -- { name = 'vsnip' }
    use 'hrsh7th/vim-vsnip'
    use 'rafamadriz/friendly-snippets'
    -- lspkind
    use 'onsails/lspkind-nvim'
    use { 'nvim-telescope/telescope.nvim',
        requires = { {'nvim-lua/plenary.nvim'},{'BurntSushi/ripgrep'} }
        }
    use 'simrat39/rust-tools.nvim'
    use 'nvim-lua/plenary.nvim'
    use 'mfussenegger/nvim-dap'
    use "ellisonleao/glow.nvim"

end)

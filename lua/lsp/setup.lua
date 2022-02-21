local lsp_installer = require "nvim-lsp-installer"

-- config lsp_installer
lsp_installer.settings({
    ui = {
        icons = {
            server_installed = "✓",
            server_pending = "➜",
            server_uninstalled = "✗"
        }
    }
})

-- Include the servers you want to have installed by default below
local servers = {
    bashls = require "lsp.bash",
    sumneko_lua = require "lsp.lua",
    clangd = require "lsp.c_cpp",
    cmake = require "lsp.cmake",
    ltex = require "lsp.latex",
    rust_analyzer = require "lsp.rust",
    svls = require "lsp.verilog",
}

for name, _ in pairs(servers) do
  local server_is_found, server = lsp_installer.get_server(name)
  if server_is_found then
    if not server:is_installed() then
      print("Installing " .. name)
      server:install()
    end
  end
end

lsp_installer.on_server_ready(function(server)
  local opts = servers[server.name]
  if opts then
    opts.on_attach = function(_, bufnr)
      local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
      -- local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end
      -- 绑定快捷键
      require('keybindings').maplsp(buf_set_keymap)
    end
    opts.flags = {
      debounce_text_changes = 150,
    }
     if server.name == "rust_analyzer" then
        -- Initialize the LSP via rust-tools instead
        require("rust-tools").setup {
            -- The "server" property provided in rust-tools setup function are the
            -- settings rust-tools will provide to lspconfig during init.            -- 
            -- We merge the necessary settings from nvim-lsp-installer (server:get_default_options())
            -- with the user's own settings (opts).
            server = vim.tbl_deep_extend("force", server:get_default_options(), opts),
        }
        server:attach_buffers()
    else
        server:setup(opts)
    end
  end
end)

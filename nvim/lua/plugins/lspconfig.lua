-- In ~/.config/nvim/lua/plugins/lspconfig.lua

return {
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      "williamboman/mason.nvim",
      "williamboman/mason-lspconfig.nvim",
    },
    config = function()
      local lspconfig = require("lspconfig")
      local capabilities = vim.lsp.protocol.make_client_capabilities()

      require("mason-lspconfig").setup({
        -- The `handlers` table is where you define how each server is set up.
        -- We'll create a default handler to set up all servers.
        handlers = {
          -- This function will be called for every LSP installed by Mason
          function(server_name)
            lspconfig[server_name].enable({
              capabilities = capabilities,
            })
          end,
        },
        ensure_installed = {},
      })
    end,
  },
}

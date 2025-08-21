return {
  -- nvim-lspconfig and Mason configuration
    {
        "neovim/nvim-lspconfig",
        dependencies = {
            "williamboman/mason.nvim",
            "williamboman/mason-lspconfig.nvim",
            -- Also add cmp dependencies here
            "hrsh7th/nvim-cmp",
            "hrsh7th/cmp-nvim-lsp",
        },
        config = function()
            require("mason").setup()
            require("mason-lspconfig").setup({
                ensure_installed = { "pyright", "eslint", "lua_ls" },
                automatic_installation = true,
            })
          
            -- Setup LSP servers with a handler
            local lspconfig = require("lspconfig")
            local capabilities = require("cmp_nvim_lsp").default_capabilities()
          
            local on_attach = function(client, bufnr)
                -- ... keymaps ...
            end

            require("mason-lspconfig").setup({
                handlers = { 
                    function(server_name)
                        require("lspconfig")[server_name].setup({})
                    end
                }
            })
        end,
    }
}

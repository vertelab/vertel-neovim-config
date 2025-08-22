return {
    {
      "sindrets/diffview.nvim",
      dependencies = { "nvim-lua/plenary.nvim", "nvim-tree/nvim-web-devicons" },
      config = function()
        require("diffview").setup()
        -- Optional key mapping to open the diff view
        vim.api.nvim_set_keymap(
            "n",
            "<Leader>dv",
            ":DiffviewOpen<CR>",
            { noremap = true, silent = true }
        )
      end,
    }
}

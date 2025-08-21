return {
    {
      "sindrets/diffview.nvim",
      dependencies = { "nvim-lua/plenary.nvim" },
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

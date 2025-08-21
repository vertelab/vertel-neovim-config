return {
    "numToStr/Comment.nvim",
    opts = {},
    event = "VeryLazy",
    config = function()
        require('Comment').setup()
        vim.keymap.set('v', '<S-e>', "<Plug>(comment_toggle_linewise_visual)", {desc="Comment selection"})
    end
}


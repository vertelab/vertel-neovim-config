require("config.lazy")

-- Set the number of spaces a tab character will use.
vim.opt.tabstop = 4

-- Set the number of spaces for auto-indenting.
vim.opt.shiftwidth = 4

-- Convert tabs to spaces. This is crucial for consistency.
vim.opt.expandtab = true

vim.opt.number = true
vim.opt.relativenumber = true

vim.opt.smartindent = true

vim.opt.clipboard:append('unnamedplus')

vim.keymap.set("n", "<leader>e", ":Lexplore<CR>", { noremap = true, silent = true })

vim.keymap.set("i", "<S-Tab>", "<C-d>")

vim.keymap.set("v", "<Tab>", ">gv")
vim.keymap.set("v", "<S-Tab>", "<gv")

vim.api.nvim_create_autocmd("BufEnter", {
  pattern = "*",
  callback = function()
    -- Check if the current window is a netrw (explorer) window
    if vim.bo.filetype == "netrw" then
      return
    end
    -- Check if there is any netrw window open, and if so, close it
    for _, win in ipairs(vim.api.nvim_list_wins()) do
      local buf = vim.api.nvim_win_get_buf(win)
      if vim.bo[buf].filetype == "netrw" then
        vim.api.nvim_win_close(win, true)
      end
    end
  end,
})


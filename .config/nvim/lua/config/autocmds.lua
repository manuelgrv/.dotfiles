-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
-- Add any additional autocmds here

-- Obsidian Toggle
vim.api.nvim_create_autocmd("FileType", {
  pattern = "markdown",
  callback = function()
    if vim.fn.exists(":ObsidianToggleCheckbox") == 2 then
      vim.keymap.set("n", "<CR>", "<cmd>ObsidianToggleCheckbox<CR>", { buffer = true, silent = true })
    end
  end,
})

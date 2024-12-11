-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- Disable F1 in all modes
vim.keymap.set("n", "<F1>", "<nop>", { noremap = true, silent = true })
vim.keymap.set("i", "<F1>", "<nop>", { noremap = true, silent = true })
vim.keymap.set("v", "<F1>", "<nop>", { noremap = true, silent = true })

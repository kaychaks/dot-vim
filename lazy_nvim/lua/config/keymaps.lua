-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

vim.keymap.set("i", "jk", "<esc>", { desc = "Quick escape" })

-- helix kind of feeling
vim.keymap.set("n", "x", "V", { desc = "Select line", remap = false, silent = true })

vim.keymap.set("n", "d", "vd<esc>", { desc = "Select character", remap = false, silent = true })
vim.keymap.set("n", "c", "vc", { desc = "Select character", remap = false, silent = true })

vim.keymap.set("n", "w", "vw", { desc = "Select character", remap = false, silent = true })
vim.keymap.set("n", "W", "vW", { desc = "Select character", remap = false, silent = true })
vim.keymap.set("n", "e", "ve", { desc = "Select character", remap = false, silent = true })
vim.keymap.set("n", "E", "vE", { desc = "Select character", remap = false, silent = true })
vim.keymap.set("n", "b", "vb", { desc = "Select character", remap = false, silent = true })
vim.keymap.set("n", "B", "vB", { desc = "Select character", remap = false, silent = true })

vim.keymap.set("v", "x", "j", { desc = "Keep selecting line", remap = false, silent = true })

-- Keymaps
vim.g.mapleader = " "
vim.g.maplocalleader = " "

vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

vim.keymap.set("x", "<leader>p", '"_dP')
vim.keymap.set("n", "<leader>y", '"+y')

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

vim.keymap.set("i", "jk", "<Esc>", { desc = "jk to escape insert mode" })
vim.keymap.set("n", "<Esc>", ":noh<CR>", { desc = "Clear search highlights" })

-- Window management
vim.keymap.set("n", "<leader>sv", ":vsplit<CR>", { desc = "Vertical split" })
vim.keymap.set("n", "<leader>sh", ":split<CR>", { desc = "Horizontal split" })
vim.keymap.set("n", "<leader>se", ":wincmd =<CR>", { desc = "Equalize splits" })
vim.keymap.set("n", "<leader>sx", ":q<CR>", { desc = "Exit split" })

vim.api.nvim_set_keymap("n", ":", "<cmd>FineCmdline<CR>", { noremap = true })


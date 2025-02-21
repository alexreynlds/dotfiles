vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

vim.keymap.set({'n', 'v' }, '<Space>', '<Nop>', {silent = true})

local opts = {noremap = true, silent = true}

vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

vim.keymap.set("x", "<leader>p", '"_dP')
vim.keymap.set({"n", "v"}, "<leader>y", '"+Y')

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

vim.keymap.set("i", "jk", "<Esc>", { desc = "jk to escape insert mode" })
vim.keymap.set("n", "<Esc>", ":noh<CR>", { desc = "Clear search highlights" })

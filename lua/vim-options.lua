vim.cmd("set expandtab")
vim.cmd("set number")
vim.cmd("set tabstop=2")
vim.cmd("set softtabstop=2")
vim.cmd("set shiftwidth=2")
vim.cmd("set relativenumber")
vim.cmd("set nowrap")
vim.cmd("set scrolloff=8")
vim.cmd("set updatetime=50")
vim.cmd("set conceallevel=1")
vim.cmd("set wildmenu")

vim.g.mapleader = " "
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

vim.keymap.set("x", "<leader>p", '"_dP')
vim.keymap.set("n", "<leader>y", '"+y')

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

vim.cmd("command! PersonalWorkspace cd ~/Developer/Vault")
vim.keymap.set("n", "<leader>pw", ":PersonalWorkspace<CR>, {noremap = true, silent = true}")

vim.cmd("set expandtab")
vim.cmd("set autoindent")
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

-- Search settings
vim.cmd("set ignorecase")
vim.cmd("set smartcase")

vim.cmd("set backspace")

vim.cmd("set cursorline")

vim.api.nvim_create_autocmd("ColorScheme", {
	command = [[hi clear CursorLine]],
})
vim.api.nvim_create_autocmd("ColorScheme", {
	command = [[hi CursorLine gui=underline cterm=underline]],
})

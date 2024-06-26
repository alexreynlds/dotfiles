local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)
vim.g.python3_host_prog = "/opt/homebrew/bin/python3"

require("vim-options")
require("keymaps")

require("lazy").setup({ { import = "plugins" }, { import = "plugins.lsp" } }, {
	change_detection = { notify = false },
	checker = { enabled = true, notify = false },
})

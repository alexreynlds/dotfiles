require("core.options")
require("core.keymaps")

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
	local lazyrepo = "https://github.com/folke/lazy.nvim.git"
	local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
	if vim.v.shell_error ~= 0 then
		error("Error cloning lazy.nvim:\n" .. out)
	end
end ---@diagnostic disable-next-line: undefined-field
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
	require("plugins.tokyonights"),
	require("plugins.neotree"),
	require("plugins.tmuxnav"),
	require("plugins.lualine"),
	require("plugins.treesitter"),
	require("plugins.telescope"),
	require("plugins.autocomplete"),
	require("plugins.lsp"),
	require("plugins.snacks"),
	require("plugins.none-ls"),
	require("plugins.gitsigns"),
	require("plugins.smear-cursor"),
	require("plugins.copilot"),
	require("plugins.autopairs"),
	require("plugins.codesnap"),
	require("plugins.surround"),
	require("plugins.todo-comments"),
	require("plugins.lazygit"),
	require("plugins.finecmd"),
})

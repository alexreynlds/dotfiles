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
	require("plugins.alpha"),
	require("plugins.neotree"),
	require("plugins.tmux-nav"),
	require("plugins.finecmd"),
	require("plugins.lualine"),
	require("plugins.treesitter"),
	require("plugins.telescope"),
	require("plugins.lazygit"),
	require("plugins.copilot"),
	require("plugins.lsp"),
	require("plugins.conform"),
	require("plugins.autocomplete"),
	require("plugins.todo"),
	require("plugins.which-key"),
	require("plugins.codesnap"),
	require("plugins.dressing"),
	require("plugins.gitsigns"),
	require("plugins.fugitive"),
	require("plugins.surround"),
	require("plugins.autopairs"),
	require("plugins.autotag"),
	require("plugins.comment"),
})

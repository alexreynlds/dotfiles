return {
	"kdheepak/lazygit.nvim",
	cmd = {
		"LazyGit",
		"LazyGitConfig",
		"LazyGitCurrentFile",
		"LazyGitFilter",
		"LazyGitFilterCurrentFile",
	},

	dependencies = {
		"nvim-lua/plenary.nvim",
	},

	-- Keybindings
	keys = {
		{ "<leader>lg", "<cmd>LazyGit<CR>", desc = "Open LazyGit" },
	},
}

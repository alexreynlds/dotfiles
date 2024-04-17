return {
	"nvim-neo-tree/neo-tree.nvim",
	branch = "v3.x",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-tree/nvim-web-devicons",
		"MunifTanjim/nui.nvim",
	},
	config = function()
		vim.keymap.set("n", "<leader>n", ":Neotree toggle left<CR>", { desc = "Toggle NeoTree" })
		vim.keymap.set("n", "<leader>N", ":Neotree toggle reveal<CR>", { desc = "Toggle Reveal NeoTree" })
		require("neo-tree").setup({
			filesystem = {
				filtered_items = {
					visible = false,
					hide_dotfiles = true,
					hide_gitignored = false,
					hide_by_name = {
						--	".DS_Store",
					},
				},
			},
		})
	end,
}

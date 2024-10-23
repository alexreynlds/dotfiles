return {
	{
		"nvim-treesitter/nvim-treesitter",
		event = { "BufRead", "BufNewFile" },
		build = ":TSUpdate",
		config = function()
			local treesitter = require("nvim-treesitter.configs")
			treesitter.setup({
				highlight = { enable = true },
				indent = { enable = true },
				ensure_installed = {
					"javascript",
					"lua",
					"c_sharp",
					"cpp",
					"c",
					"tsx", -- Add this line for JSX/TSX support
					"python",
				},
			})
		end,
	},
	{
		"nvim-treesitter/playground",
	},
}

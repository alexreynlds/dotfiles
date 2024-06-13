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
					--      "html",
					-- "json",
					-- "lua",
					-- "python",
					-- "rust",
					-- "yaml",
					-- "toml",
					"tsx", -- Add this line for JSX/TSX support
				},
			})
		end,
	},
	{
		"nvim-treesitter/playground",
	},
}

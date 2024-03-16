return {
	{
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
		config = function()
			local config = require("nvim-treesitter.configs")
			config.setup({
				ensure_installed = {
					"typescript",
					"lua",
					"javascript",
					"python",
					"cpp",
					"markdown",
					"markdown_inline",
					"cpp",
				},
				auto_install = true,
				highlight = { enable = true },
				indent = { enable = true },
				additional_vim_regex_highlighting = { "markdown" },
			})
		end,
	},
	{
		"nvim-treesitter/playground",
	},
}

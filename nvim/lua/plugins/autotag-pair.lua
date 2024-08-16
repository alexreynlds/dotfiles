return {
	"windwp/nvim-ts-autotag",
	event = "InsertEnter",
	dependencies = {
		"hrsh7th/nvim-cmp",
	},
	config = function()
		require("nvim-ts-autotag").setup({
			opts = {
				enable_rename = false,
			},
		})
		local cmp = require("cmp")
		cmp.setup.buffer({
			sources = {
				{ name = "nvim_ts_autotag" },
			},
		})
	end,
}

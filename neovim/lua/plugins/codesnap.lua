return {
	"mistricky/codesnap.nvim",
	lazy = "true",
	build = "make",
	keys = {
		{ "<leader>cc", "<cmd>CodeSnap<cr>", mode = "x", desc = "Save selected code snapshot into clipboard" },
		{
			"<leader>cs",
			"<cmd>CodeSnapSave<cr>",
			mode = "x",
			desc = "Save selected code snapshot in ~/Pictures",
		},
	},
	opts = {
		save_path = "~/Pictures/Codesnaps/",
		has_breadcrumbs = true,
		bg_theme = "dusk",
		watermark = "",
	},
	config = function(_, opts)
		require("codesnap").setup(opts)
	end,
}

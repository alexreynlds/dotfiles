return {
	{
		"folke/snacks.nvim",
		priority = 1000,
		lazy = false,
		---@type snacks.Config
		opts = {
			-- your configuration comes here
			-- or leave it empty to use the default settings
			-- refer to the configuration section below
			bigfile = { enabled = true },
			dashboard = {
				width = 60,
				pane_gap = 16,
				sections = {
					{
						section = "header",
						align = "center",
						enabled = function()
							return not (vim.o.columns > 135)
						end,
					},
					{
						pane = 1,
						{
							enabled = function()
								return vim.o.columns > 135
							end,
							section = "terminal",
							-- cmd = "img2art ~/.config/nvim/lua/plugins/dashboard_img/hq.png --threshold 50 --scale .34 --quant 16 --with-color",
							height = 32,
							width = 56,
							padding = 1,
						},
						{
							section = "startup",
							padding = 1,
							enabled = function()
								return vim.o.columns > 135
							end,
						},
					},
					{
						pane = 2,
						{ section = "keys", padding = 2, gap = 1 },
						{
							icon = " ",
							title = "Recent Files",
						},
						{
							section = "recent_files",
							opts = { limit = 3 },
							indent = 2,
							padding = 1,
						},
						{
							icon = " ",
							title = "Projects",
						},
						{
							section = "projects",
							opts = { limit = 3 },
							indent = 2,
							padding = 1,
						},
						{
							section = "startup",
							padding = 1,
							enabled = function()
								return not (vim.o.columns > 135)
							end,
						},
					},
				},
			},
			explorer = { enabled = true },
			indent = { enabled = true },
			input = { enabled = true },
			picker = { enabled = true },
			notifier = { enabled = true },
			quickfile = { enabled = true },
			scope = { enabled = true },
			scroll = { enabled = true },
			statuscolumn = { enabled = true },
			words = { enabled = true },
		},
	},
	{
		"folke/ts-comments.nvim",
		opts = {},
		event = "VeryLazy",
		enabled = vim.fn.has("nvim-0.10.0") == 1,
	},
}

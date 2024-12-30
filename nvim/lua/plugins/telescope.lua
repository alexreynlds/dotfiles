return {
	{
		"nvim-telescope/telescope.nvim",
		tag = "0.1.5",
		dependencies = {
			"nvim-lua/plenary.nvim",
			{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
			"nvim-tree/nvim-web-devicons",
			"folke/todo-comments.nvim",
			"nvim-telescope/telescope-live-grep-args.nvim",
		},
		config = function()
			local builtin = require("telescope.builtin")
			local actions = require("telescope.actions")
			local telescope = require("telescope")

			vim.keymap.set("n", "<leader>pf", builtin.find_files, { desc = "Telescope Find Files" })
			vim.keymap.set("n", "<leader>fr", builtin.oldfiles, { desc = "Telescope Find Recent" })
			vim.keymap.set(
				"n",
				"<leader>fg",
				":lua require('telescope').extensions.live_grep_args.live_grep_args()<CR>"
			)
			vim.keymap.set("n", "<leader>tc", ":Telescope commands<CR>", { noremap = true, silent = true })
			vim.keymap.set("n", "<leader>ft", "<cmd>TodoTelescope<cr>", { desc = "Find todos" })

			require("telescope").setup({
				defaults = {
					mappings = {
						i = {
							["<esc>"] = actions.close,
							["<C-j>"] = actions.move_selection_next,
							["<C-k>"] = actions.move_selection_previous,
						},
					},
				},
			})

			telescope.load_extension("fzf")
			telescope.load_extension("live_grep_args")
		end,
	},
	{
		"nvim-telescope/telescope-ui-select.nvim",
		config = function()
			require("telescope").setup({
				extensions = {
					["ui-select"] = {
						require("telescope.themes").get_dropdown({}),
					},
				},
			})
			require("telescope").load_extension("ui-select")
		end,
	}, -- added comma here
}


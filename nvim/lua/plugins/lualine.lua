return {
	"nvim-lualine/lualine.nvim",
	requires = { "kyazdani42/nvim-web-devicons", opt = true },
	config = function()
		local lazy_status = require("lazy.status")
		require("lualine").setup({
			options = {
        theme = 'tokyonight-moon',
				component_separators = "",
				section_separators = { left = "", right = "" },
			},
			sections = {
				lualine_a = { { "mode", right_padding = 2 } },
				lualine_b = { { "filename", file_status = true, path = 1 } },
				lualine_c = {
					"branch", --[[ add your center compoentnts here in place of this comment ]]
				},
				lualine_x = {
					{
						lazy_status.updates,
						cond = lazy_status.has_updates,
					},
					{ "encoding", "fileformat", "filetype" },
				},
				lualine_y = { "filetype", "progress" },
				lualine_z = {
					{ "location", left_padding = 2 },
				},
			},
		})
	end,
}


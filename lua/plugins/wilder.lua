return {
	"gelguy/wilder.nvim",
	config = function()
		require("wilder").setup({
			quick_ref_win_persistent = true,
		})
	end,
}

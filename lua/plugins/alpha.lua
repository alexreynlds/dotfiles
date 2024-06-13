return {
	"goolord/alpha-nvim",
	event = "VimEnter",
	cmd = "Alpha", -- Specify the command to open the Alpha dashboard

	config = function()
		local alpha = require("alpha")
		local dashboard = require("alpha.themes.dashboard")
		require("alpha.term")

		-- Setup the dashboard options
		dashboard.opts.noautocmd = true

		-- Setup the terminal section
		dashboard.section.terminal.opts.redraw = true
		dashboard.section.terminal.command = "cat ~/.config/nvim/lua/plugins/Ayanami.txt"
		dashboard.section.terminal.width = 59
		dashboard.section.terminal.height = 30
		dashboard.section.terminal.opts.window_config.border = "rounded"

		-- Setup other sections
		dashboard.section.header.val = "foo"
		dashboard.section.buttons.val = {
			dashboard.button("e", "  New file", ":ene <BAR> startinsert <CR>"),
			dashboard.button("SPC n", "  Toggle file explorer", ":Neotree toggle left<CR>"),
			dashboard.button("SPC pf", "  Find file", ":Telescope find_files<CR>"),
			dashboard.button("q", "󰩈  Quit NVIM", ":qa<CR>"),
		}

		local stats = require("lazy").stats()
		local ms = math.floor(stats.startuptime + 0.5)
		dashboard.section.footer.val = { " ", " ", " ", "Loaded " .. stats.count .. " plugins  in " .. ms .. "ms" }
		dashboard.section.footer.opts.hl = "DashboardFooter"
		pcall(vim.cmd.AlphaRedraw)
		-- Setup the layout
		dashboard.opts.layout = {
			dashboard.section.terminal,
			{ type = "padding", val = 3 },
			dashboard.section.buttons,
			dashboard.section.footer,
		}

		-- Apply the configuration
		alpha.setup(dashboard.config)
		vim.cmd([[autocmd FileType alpha setlocal nofoldenable]])
	end,
}

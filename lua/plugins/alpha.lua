return {
	"goolord/alpha-nvim",
	lazy = false,
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
		dashboard.section.terminal.height = 32
		dashboard.section.terminal.opts.window_config.border = "rounded"

		-- Setup other sections
		dashboard.section.header.val = "foo"
		dashboard.section.buttons.val = {
			dashboard.button("e", "  New file", ":ene <BAR> startinsert <CR>"),
			dashboard.button("q", "  Quit NVIM", ":qa<CR>"),
		}

		local stats = require("lazy").stats()
		local ms = math.floor(stats.startuptime * 100 + 0.5) / 100
		dashboard.section.footer.val = { " ", " ", " ", "Loaded " .. stats.count .. " plugins  in " .. ms .. "ms" }
		dashboard.section.footer.opts.hl = "DashboardFooter"
		pcall(vim.cmd.AlphaRedraw)
		-- Setup the layout
		dashboard.opts.layout = {
			{ type = "padding", val = 2 },
			dashboard.section.terminal,
			{ type = "padding", val = 2 },
			dashboard.section.buttons,
			dashboard.section.footer,
		}

		-- Apply the configuration
		alpha.setup(dashboard.config)
	end,
}

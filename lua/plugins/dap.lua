return {
	{
		"jay-babu/mason-nvim-dap.nvim",
		dependencies = {
			"williamboman/mason.nvim",
			"nvim-neotest/nvim-nio",
			"mfussenegger/nvim-dap",
		},
		event = "VeryLazy",
		opts = {
			handlers = {},
		},
	},
	{
		"rcarriga/nvim-dap-ui",
		event = "VeryLazy",
		dependencies = {
			"mfussenegger/nvim-dap",
		},
		config = function()
			local dap = require("dap")
			local dapui = require("dapui")
			dapui.setup()
			dap.listeners.after.event_initialized["dapui_cofig"] = function()
				dapui.open()
			end

			dap.listeners.after.event_terminated["dapui_cofig"] = function()
				dapui.close()
			end

			dap.listeners.after.event_exited["dapui_cofig"] = function()
				dapui.close()
			end
		end,
	},
	{
		"mfussenegger/nvim-dap",
		config = function()
			vim.keymap.set("n", "<leader>db", "<cmd> DapToggleBreakpoint<CR>", { noremap = true, silent = true })
			vim.keymap.set("n", "<leader>dr", "<cmd> DapContinue<CR>", { noremap = true, silent = true })
		end,
	},
}

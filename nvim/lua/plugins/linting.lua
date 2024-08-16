return {
	"mfussenegger/nvim-lint",
	event = { "BufReadPre", "BufNewFile" },
	config = function()
		local lint = require("lint")

		lint.linters.pylint = {
			cmd = "pylint",
			args = {
				"--disable=C0114", -- Example argument: Disable missing module docstring warning
				"--max-line-length=100", -- Example argument: Set max line length to 100
			},
			stdin = false,
			stream = "stdout",
			ignore_exitcode = true,
			env = nil,
			parser = require("lint.parser").from_errorformat(
				[[
%f:%l:%c: %t: %m
]],
				{
					source = "pylint",
					severity = vim.diagnostic.severity.ERROR,
				}
			),
		}

		lint.linters_by_ft = {
			javascript = { "eslint_d" },
			typescript = { "eslint_d" },
			javascriptreact = { "eslint_d" },
			typescriptreact = { "eslint_d" },
			svelte = { "eslint_d" },
			python = { "pylint" },
		}

		local lint_augroup = vim.api.nvim_create_augroup("lint", { clear = true })

		vim.api.nvim_create_autocmd({ "BufEnter", "BufWritePost", "InsertLeave" }, {
			group = lint_augroup,
			callback = function()
				lint.try_lint()
			end,
		})

		vim.keymap.set("n", "<leader>ll", function()
			lint.try_lint()
		end, { desc = "Trigger linting for current file" })
	end,
}

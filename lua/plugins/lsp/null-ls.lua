return {
	"nvimtools/none-ls.nvim",
	event = { "bufRead", "bufNewFile" },
	dependencies = { "jay-babu/mason-null-ls.nvim", "nvimtools/none-ls-extras.nvim" },
	config = function()
		local mason_null_ls = require("mason-null-ls")
		local null_ls = require("null-ls")
		local null_ls_utils = require("null-ls.utils")

		mason_null_ls.setup({
			ensure_installed = {
				"prettierd",
				"stylua",
				"black",
				"pylint",
				"eslint",
				"clang-format",
			},
			automatic_installation = true,
		})

		local formatting = null_ls.builtins.formatting
		local diagnostics = null_ls.builtins.diagnostics

		local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

		local python_exe = "/opt/homebrew/bin/python3"

		null_ls.setup({
			root_dir = null_ls_utils.root_pattern(".null-ls-root", "Makefile", ".git", "package.json"),

			sources = {
				formatting.stylua,
				formatting.isort,
				formatting.black,
				diagnostics.pylint.with({
					command = python_exe .. " -m pylint",
				}),
				formatting.prettierd,
				formatting.clang_format,
			},
			on_attach = function(current_client, bufnr)
				if current_client.supports_method("textDocument/formatting") then
					vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
					vim.api.nvim_create_autocmd("BufWritePre", {
						group = augroup,
						buffer = bufnr,
						callback = function()
							vim.lsp.buf.format({
								filter = function(client)
									--  only use null-ls for formatting instead of lsp server
									return client.name == "null-ls"
								end,
								bufnr = bufnr,
							})
						end,
					})
				end
			end,
		})
		vim.keymap.set("n", "<leader>gf", vim.lsp.buf.format)
	end,
}

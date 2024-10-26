return {
	"stevearc/conform.nvim",
	event = { "BufReadPre", "BufNewFile" },
	config = function()
		local conform = require("conform")

		conform.setup({
			formatters_by_ft = {
				lua = { "stylua" },
				javascript = { { "prettierd", "prettier", stop_after_first = true } },
				typescript = { { "prettierd", "prettier", stop_after_first = true } },
				javascriptreact = { { "prettierd", "prettier", stop_after_first = true } },
				typescriptreact = { { "prettierd", "prettier", stop_after_first = true } },
				json = { { "prettierd", "prettier", stop_after_first = true } },
				markdown = { { "prettierd", "prettier", stop_after_first = true } },
				bash = { "beautysh" },
				css = { { "prettierd", "prettier", stop_after_first = true } },
				scss = { { "prettierd", "prettier", stop_after_first = true } },
				c = { "clang_format" },
			},
			formatters = {
				clang_format = {
					prepend_args = { "--style", "webkit" },
				},
			},
		})

		vim.keymap.set({ "n", "v" }, "<leader>l", function()
			conform.format({
				lsp_fallback = true,
				async = true,
				timeout_ms = 2500,
			})
		end, { desc = "Format file or range (in visual mode)" })
	end,
}

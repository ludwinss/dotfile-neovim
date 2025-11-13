local M = {}

function M.setup()
	local conform = require("conform")

	conform.setup({
		default_format_opts = {
			lsp_fallback = true,
			async = true,
		},
		formatters_by_ft = {
			lua = { "stylua" },
			bash = { "shfmt" },
			sh = { "shfmt" },
			javascript = { "prettierd", "prettier" },
			typescript = { "prettierd", "prettier" },
			json = { "jq" },
			python = { "black" },
			go = { "gofmt" },
		},
	})
end

return M

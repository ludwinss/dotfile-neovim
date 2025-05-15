require("conform").setup({
	notify_on_error = false,

	format_on_save = function()
		if vim.g.disable_autoformat then
			return
		end
		return { timeout_ms = 800, lsp_fallback = true, quiet = true }
	end,

	default_format_opts = { lsp_format = "fallback" },

	formatters_by_ft = {
		lua = { "stylua" },
		rust = { "rustfmt", "lsp" },

		javascript = { "prettierd", "eslint_d" },
		typescript = { "prettierd", "eslint_d" },
		javascriptreact = { "prettierd", "eslint_d" },
		typescriptreact = { "prettierd", "eslint_d" },

		python = { "ruff_fix", "black" },

		json = { "prettierd" },
		markdown = { "prettierd" },
		csharp = { "csharpier", "lsp" },
	},

	formatters = {
		eslint_d = {
			condition = function(ctx)
				return vim.fs.find({
					".eslintrc",
					".eslintrc.js",
					".eslintrc.cjs",
					"package.json",
				}, { upward = true, path = ctx.filename })[1] ~= nil
			end,
			prepend_args = { "--fix", "--rule", "prettier/prettier: off" },
		},

		prettierd = {
			condition = function(ctx)
				return vim.fs.find({
					".prettierrc",
					".prettierrc.js",
					"prettier.config.js",
					"package.json",
				}, { upward = true, path = ctx.filename })[1] ~= nil
			end,
		},
	},
})

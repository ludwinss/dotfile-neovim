return {
	"nvimtools/none-ls.nvim",
	config = function()
		local null_ls = require("null-ls")
		null_ls.setup({
			sources = {
				null_ls.builtins.formatting.csharpier,
			},
		})

		vim.keymap.set("n", "<leader>gf", function()
			return vim.lsp.buf.format({ async = true })
		end, { desc = "LSP (null ls) Format file" })
	end,
}

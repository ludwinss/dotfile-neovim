local M = {}

function M.setup()
	local cmp = require("cmp")
	local luasnip = require("luasnip")

	pcall(require("luasnip.loaders.from_vscode").lazy_load)

	cmp.setup({
		snippet = {
			expand = function(args)
				luasnip.lsp_expand(args.body)
			end,
		},
		window = {
			completion = cmp.config.window.bordered(),
			documentation = cmp.config.window.bordered(),
		},
		mapping = cmp.mapping.preset.insert({
			["<C-Space>"] = cmp.mapping.complete(),
			["<C-e>"] = cmp.mapping.abort(),
			["<CR>"] = cmp.mapping.confirm({ select = true }),
			["<C-j>"] = cmp.mapping.select_next_item(),
			["<C-k>"] = cmp.mapping.select_prev_item(),
		}),
		sources = cmp.config.sources({
			{ name = "nvim_lsp" },
			{ name = "buffer" },
			{ name = "path" },
		}),
	})
end

return M

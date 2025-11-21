local M = {}

local function map(mode, lhs, rhs, opts)
	opts = opts or {}
	opts.silent = opts.silent ~= false
	vim.keymap.set(mode, lhs, rhs, opts)
end

function M.setup()
	map("n", "<leader>w", "<Cmd>w<CR>", { desc = "Guardar" })
	map("n", "<leader>q", "<Cmd>q<CR>", { desc = "Cerrar ventana" })
	map("n", "<leader>bd", "<Cmd>bdelete<CR>", { desc = "Cerrar buffer" })
	map("n", "<Esc>", "<Cmd>nohlsearch<CR>", { desc = "Limpiar resaltado" })

	map("n", "<C-h>", "<C-w>h", { desc = "Ventana izquierda" })
	map("n", "<C-j>", "<C-w>j", { desc = "Ventana abajo" })
	map("n", "<C-k>", "<C-w>k", { desc = "Ventana arriba" })
	map("n", "<C-l>", "<C-w>l", { desc = "Ventana derecha" })

	map("n", "<leader>e", vim.diagnostic.open_float, { desc = "Diagnóstico flotante" })
	map("n", "[d", vim.diagnostic.goto_prev, { desc = "Diagnóstico anterior" })
	map("n", "]d", vim.diagnostic.goto_next, { desc = "Diagnóstico siguiente" })

	map("n", "gd", vim.lsp.buf.definition, { desc = "Ir a definición" })
	map("n", "gr", vim.lsp.buf.references, { desc = "Ver referencias" })
	map("n", "gI", vim.lsp.buf.implementation, { desc = "Ir a implementación" })
	map("n", "<leader>rn", vim.lsp.buf.rename, { desc = "Renombrar símbolo" })
	map("n", "<leader>ca", vim.lsp.buf.code_action, { desc = "Acciones de código" })
	map("n", "K", vim.lsp.buf.hover, { desc = "Documentación LSP" })
	map({ "n", "v" }, "<leader>gf", function()
		require("conform").format({
			async = true,
			lsp_fallback = true,
		})
	end, { desc = "Formatear archivo" })

	local function toggle_oil()
		if vim.bo.filetype == "oil" then
			vim.cmd.close()
			return
		end
		vim.cmd("Oil --float")
	end

	map("n", "<leader>e", toggle_oil, { desc = "Abrir explorador (Oil)" })
end

return M

local M = {}

function M.setup()
	local oil = require("oil")

	oil.setup({
		default_file_explorer = true,
		view_options = {
			show_hidden = true,
		},
		float = {
			padding = 2,
			max_width = 80,
			max_height = 20,
		},
	})

	vim.api.nvim_create_autocmd("FileType", {
		pattern = "oil",
		callback = function(args)
			vim.keymap.set("n", "q", "<Cmd>close<CR>", { buffer = args.buf, silent = true, desc = "Cerrar Oil" })
		end,
	})
end

return M

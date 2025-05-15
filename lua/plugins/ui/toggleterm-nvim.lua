require("toggleterm").setup({
	direction = "float",
	start_in_insert = true,
	persist_mode = true,
	persist_size = true,

	on_open = function(term)
		local keymaps = require("keymaps.utils")
		keymaps.toggle_term(term)
	end,
})

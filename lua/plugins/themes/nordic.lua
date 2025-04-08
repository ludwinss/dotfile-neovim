require("nordic").setup({
	italic_comments = true,
	transparent = {
		bg = false,
		float = false,
	},
	on_highlight = function(highlights, pallette)
		highlights.Visual = { bg = pallette.orange.base, fg = pallette.black2 }
		return highlights
	end,
})

require("nordic").load({
	cursorline = {
		theme = "dark",
	},
})

require("lualine").setup({
	options = { theme = "nordic" },
})

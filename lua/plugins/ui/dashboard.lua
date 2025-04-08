local config = {}

config.shortcut = {
	{
		desc = "󰠮  Notes ",
		action = "enew | set filetype=markdown",
		group = "@string",
		key = "n",
	},
	{
		desc = " 󰱼  File ",
		action = "Telescope find_files find_command=rg,--hidden,--files",
		group = "@string",
		key = "fF",
	},
	{
		desc = "   Update ",
		action = "Lazy sync",
		group = "@string",
		key = "u",
	},
	{
		desc = " 󰓅  Profile ",
		action = "Lazy profile",
		group = "@string",
		key = "p",
	},
	{
		desc = " 󰅙  Quit ",
		action = "q!",
		group = "DiagnosticError",
		key = "q",
	},
}

config.week_header = { enable = true }
config.footer = { "", ":)" }
config.packages = { enable = true }
config.project = { enable = false }
config.mru = { enable = false }

require("dashboard").setup({
	theme = "hyper",
	config = config,
})

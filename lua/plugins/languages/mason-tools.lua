require("mason-tool-installer").setup({
	ensure_installed = {
		"csharpier",
		"stylua",
		"prettierd",
	},
	auto_update = true,
	run_on_start = true,
})

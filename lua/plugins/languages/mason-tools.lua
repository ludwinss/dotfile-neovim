require("mason-tool-installer").setup({
	ensure_installed = {
		-- "csharpier", Ahora usamos el dotnet tools install csharpier
		"stylua",
		"prettierd",
	},
	auto_update = true,
	run_on_start = true,
})

local mason_lspconfig = require("mason-lspconfig")

mason_lspconfig.setup({
	ensure_installed = {
		"cssls",
		"lua_ls",
		"julials",
		"bashls",
		"pyright",
		"rust_analyzer",
		"texlab",
		"yamlls",
		"gopls",
		"terraformls",
		"eslint",
		"ts_ls",
		"cmake",
		"dockerls",
		"docker_compose_language_service",
		"html",
		"jsonls",
		"omnisharp",
		"eslint",
		"ruff",
	},
	automatic_installation = true,
})

local lspconfig = require("lspconfig")
local capabilities = require("cmp_nvim_lsp").default_capabilities()

local lsp_flags = {
	debounce_text_changes = 250,
}

mason_lspconfig.setup_handlers({
	function(server_name)
		lspconfig[server_name].setup({
			capabilities = capabilities,
			lsp_flags = lsp_flags,
		})
	end,
})

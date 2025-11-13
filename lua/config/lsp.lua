local M = {}

local servers = {
	lua_ls = {
		settings = {
			Lua = {
				diagnostics = { globals = { "vim" } },
				workspace = { checkThirdParty = false },
				telemetry = { enable = false },
			},
		},
	},
	bashls = {},
	pyright = {},
	tsserver = {},
}

local function server_has_cmd(server, overrides)
	local ok, configs = pcall(require, "lspconfig.configs")
	if not ok then
		return true
	end

	local config = configs[server]
	if not config or not config.default_config then
		return false
	end

	local cmd = overrides.cmd or config.default_config.cmd
	if not cmd or #cmd == 0 then
		return true
	end

	local bin = type(cmd) == "table" and cmd[1] or cmd
	return vim.fn.executable(bin) == 1
end

function M.setup()
	local lspconfig = require("lspconfig")
	local capabilities = vim.lsp.protocol.make_client_capabilities()
	local ok, cmp_lsp = pcall(require, "cmp_nvim_lsp")
	if ok then
		capabilities = cmp_lsp.default_capabilities(capabilities)
	end

	for server, config in pairs(servers) do
		if server_has_cmd(server, config) then
			local opts = vim.tbl_deep_extend("force", {
				capabilities = capabilities,
			}, config or {})
			lspconfig[server].setup(opts)
		end
	end
end

return M

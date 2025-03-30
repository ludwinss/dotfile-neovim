local LU = require("lspconfig.util")
local LC = require("lspconfig")
local DC = require("cmp_nvim_lsp").default_capabilities()

require("lspconfig.ui.windows").default_options.border =
    require("utils").get_border_chars("float")

local lsp_flags = {
  debounce_text_changes = 250,
}

local default = {
  lsp_flags = lsp_flags,
  capabilities = DC,
}

LC.cssls.setup({ default })
LC.nixd.setup({ default })
LC.lua_ls.setup({ default })
LC.julials.setup({ default })
LC.bashls.setup({ default })
LC.pyright.setup({ default })
--LC.ruff_lsp.setup { default }
LC.rust_analyzer.setup({ default })
LC.texlab.setup({ default })
LC.yamlls.setup({ default })
LC.gopls.setup({ default })
--LC.hls.setup { default }
LC.terraformls.setup({ default })
-- LC.powershell_es.setup({
--   bundle_path = "~/.local/share/nvim/mason/packages/powershell-editor-services",
-- })

LC.eslint.setup({
  lsp_flags = lsp_flags,
  capabilities = DC,
  root_dir = LU.root_pattern(".eslintrc", "package.json", ".git"),
  on_attach = function(client, bufnr)
    if client.name == "eslint" then
      vim.api.nvim_create_autocmd("BufWritePre", {
        buffer = bufnr,
        command = "EslintFixAll",
      })
    end
  end
})

LC.ts_ls.setup({
  lsp_flags = lsp_flags,
  capabilities = DC,
  root_dir = LU.root_pattern("tsconfig.json", "package.json", ".git"),
  on_attach = function(client)
    client.server_capabilities.documentFormattingProvider = false
  end,
})

LC.cmake.setup({
  lsp_flags = lsp_flags,
  capabilities = DC,
  root_dir = LU.root_pattern("CMakeLists.txt"),
})

LC.dockerls.setup({
  lsp_flags = lsp_flags,
  capabilities = DC,
  root_dir = LU.root_pattern({
    "[dD]ockerfile*",
  }),
})

LC.docker_compose_language_service.setup({
  default.lsp_flags,
  default.capabilities,
  root_dir = LU.root_pattern({
    "docker-compose.ya?ml",
    "compose.ya?ml",
  }),
})

LC.html.setup({
  capabilities = DC,
  lsp_flags = lsp_flags,
  cmd = { "html-languageserver" },
})

LC.jsonls.setup({
  capabilities = DC,
  lsp_flags = lsp_flags,
  cmd = { "json-languageserver", "--stdio" },
})

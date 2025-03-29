return {
  {
    "williamboman/mason.nvim",
    lazy = false,
    config = function()
      require("mason").setup()
    end,
  },
  {
    "williamboman/mason-lspconfig.nvim",
    lazy = false,
    config = function()
      local capabilities = require("cmp_nvim_lsp").default_capabilities({})
      local handlers = {
        function(server_name)
          require("lspconfig")[server_name].setup({
            capabilities = capabilities,
          })
        end,
      }
      local lspconfig = require("lspconfig")
      lspconfig.html.setup({
        capabilities = capabilities,
        filetypes = { "html", "ejs" },
      })

      lspconfig.ts_ls.setup({
        capabilities = capabilities,
        on_attach = function(client)
          client.server_capabilities.documentFormattingProvider = false
        end,
      })
      lspconfig.lua_ls.setup({
        settings = {
          Lua = {
            runtime = {
              version = "LuaJIT", -- importante para Neovim
              path = vim.split(package.path, ";"),
            },
            diagnostics = {
              globals = { "vim" }, -- 👈 le decís que `vim` es global
            },
            workspace = {
              library = vim.api.nvim_get_runtime_file("", true), -- Neovim API
              checkThirdParty = false,                           -- opcional
            },
            telemetry = { enable = false },
          },
        },
      })

      local luasnip = require("luasnip")

      vim.filetype.add({ extension = { ejs = "ejs" } })
      luasnip.filetype_set("ejs", { "html", "javascript", "ejs" })

      require("mason-lspconfig").setup({
        automatic_installation = true,
        handlers = handlers,
        ensure_installed = {
          "cssls",
          "bashls",
          "dockerls",
          "lua_ls",
          "jsonls",
          "html",
          "remark_ls",
          "yamlls",
        },
      })
    end,
  },
  {
    "neovim/nvim-lspconfig",
  }
}

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

      lspconfig.csharp_ls.setup({
        capabilities = require("cmp_nvim_lsp").default_capabilities(),
        on_attach = function(client)
          client.server_capabilities.documentFormattingProvider = false
          client.server_capabilities.documentRangeFormattingProvider = false
        end,
      })

      lspconfig.tsserver.setup({
        capabilities = capabilities,
        on_attach = function(client)
          client.server_capabilities.documentFormattingProvider = false
        end,
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
          "taplo",
          "yamlls",
          "csharp_ls",
        },
      })
    end,
  },
  {
    "neovim/nvim-lspconfig",
    lazy = false,
    config = function()
      vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
      vim.keymap.set("n", "<leader>gd", vim.lsp.buf.definition, {})
      vim.keymap.set("n", "<leader>gr", vim.lsp.buf.references, {})
      vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, {})
    end,
  },
}

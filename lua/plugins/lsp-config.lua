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
      local capabilities = require('cmp_nvim_lsp').default_capabilities()
      local handlers = {
        function(server_name)
          require("lspconfig")[server_name].setup {
            capabilities = capabilities,
          }
        end,
      }
      local lspconfig = require("lspconfig")
      lspconfig.html.setup {
        capabilities = capabilities,
        filetypes = { "html", "ejs" },
      }
      local luasnip = require("luasnip")

      vim.filetype.add({ extension = { ejs = "ejs" } })
      luasnip.filetype_set("ejs", { "html", "javascript", "ejs" })

      require('mason-lspconfig').setup({
        automatic_installation = true,
        handlers = handlers,
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

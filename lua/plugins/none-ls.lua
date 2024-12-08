return {
  "nvimtools/none-ls.nvim",
  config = function()
    local null_ls = require("null-ls")

    null_ls.setup({
      sources = {
        -- Formatters
        null_ls.builtins.formatting.csharpier.with({
          filetypes = { "cs" }, -- Solo para archivos .cs
        }),
        null_ls.builtins.formatting.prettier.with({
          filetypes = { "javascript", "typescript", "css", "html", "json", "markdown" },
        }),
        null_ls.builtins.formatting.stylua, -- Lua
        null_ls.builtins.formatting.clang_format.with({
          filetypes = { "c", "cpp", "objc", "objcpp" },
        }),

        -- Linters
    --    null_ls.builtins.diagnostics.eslint_d.with({
    --      filetypes = { "javascript", "typescript" },
    --    }),
        null_ls.builtins.diagnostics.yamllint.with({
          filetypes = { "yaml" },
        }),
        null_ls.builtins.diagnostics.markdownlint.with({
          filetypes = { "markdown" },
        }),
      },
    })

    vim.keymap.set("n", "<leader>gf", function()
      return vim.lsp.buf.format({ async = true })
    end, { desc = "LSP (null-ls) Format file" })
  end,
}


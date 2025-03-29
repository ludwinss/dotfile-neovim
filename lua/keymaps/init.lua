local K = {}

local keymap = vim.keymap.set
local default_opts = { noremap = true, silent = true }

local n, i, v, t = "n", "i", "v", "t"

function K.init()
  K.git()
  K.lsp()
  K.null_ls()
  K.tree()
  K.telescope()
end

function K.native()
  keymap(n, "<C-w><C-c>", "<Cmd>wincmd c<CR>", default_opts)
  keymap(n, "<C-h>", "<Cmd>wincmd h<CR>", default_opts)
  keymap(n, "<C-j>", "<Cmd>wincmd j<CR>", default_opts)
  keymap(n, "<C-k>", "<Cmd>wincmd k<CR>", default_opts)
  keymap(n, "<C-l>", "<Cmd>wincmd l<CR>", default_opts)
  keymap(t, "<C-w><C-c>", "<Cmd>wincmd c<CR>", default_opts)
  keymap(t, "<C-h>", "<C-\\><C-n><C-w>h", default_opts)
  keymap(t, "<C-j>", "<C-\\><C-n><C-w>j", default_opts)
  keymap(t, "<C-k>", "<C-\\><C-n><C-w>k", default_opts)
  keymap(t, "<C-l>", "<C-\\><C-n><C-w>l", default_opts)
end

function K.git()
  keymap(n, "<leader>gp", ":Gitsigns preview_hunk<CR>",
    vim.tbl_extend("force", default_opts, {
      desc = "Ver cambios del hunk actual"
    }))

  keymap(n, "<leader>gt", ":Gitsigns toggle_current_line_blame<CR>",
    vim.tbl_extend("force", default_opts, {
      desc = "Ver quién modificó esta línea"
    }))

  keymap(n, "<leader>gs", ":Gitsigns stage_hunk<CR>",
    vim.tbl_extend("force", default_opts, {
      desc = "Staggear hunk actual"
    }))
end

function K.lsp()
  keymap(n, "K", vim.lsp.buf.hover,
    vim.tbl_extend("force", default_opts, {
      desc = "Mostrar documentación flotante"
    }))

  keymap(n, "<leader>gd", vim.lsp.buf.definition,
    vim.tbl_extend("force", default_opts, {
      desc = "Ir a la definición"
    }))

  keymap(n, "<leader>gr", vim.lsp.buf.references,
    vim.tbl_extend("force", default_opts, {
      desc = "Buscar referencias"
    }))

  keymap(n, "<leader>ca", vim.lsp.buf.code_action,
    vim.tbl_extend("force", default_opts, {
      desc = "Acciones de código"
    }))
end

function K.null_ls()
  keymap(n, "<leader>gf", function()
    return vim.lsp.buf.format({ async = true })
  end, vim.tbl_extend("force", default_opts, {
    desc = "Formatear archivo"
  }))
end

function K.tree()
  vim.api.nvim_set_keymap(n, '<C-n>', ':NvimTreeToggle<CR>',
    vim.tbl_extend("force", default_opts, {
      desc = "Abrir árbol de archivos"
    }))
end

function K.telescope()
  keymap(n, "<C-p>", "<cmd>Telescope find_files<CR>",
    vim.tbl_extend("force", default_opts, {
      desc = "Buscar archivos"
    }))
  keymap(n, "<leader>fg", "<cmd>Telescope live_grep<CR>",
    vim.tbl_extend("force", default_opts, {
      desc = "Buscar texto en archivos abiertos"
    }))
  keymap(n, "<leader><leader>", "<cmd>Telescope oldfiles<CR>",
    vim.tbl_extend("force", default_opts, {
      desc = "Ver archivos antiguos"
    }))
end

function K.test()
  keymap(n, "<leader>t", ":TestNearest<CR>", vim.tbl_extend("force", default_opts, {
    desc = "Ejecutar test más cercano"
  }))

  keymap(n, "<leader>T", ":TestFile<CR>", vim.tbl_extend("force", default_opts, {
    desc = "Ejecutar test en archivo"
  }))

  keymap(n, "<leader>a", ":TestSuite<CR>", vim.tbl_extend("force", default_opts, {
    desc = "Ejecutar test en suite"
  }))

  keymap(n, "<leader>l", ":TestLast<CR>", vim.tbl_extend("force", default_opts, {
    desc = "Ejecutar último test"
  }))

  keymap(n, "<leader>g", ":TestVisit<CR>", vim.tbl_extend("force", default_opts, {
    desc = "Abrir test en el navegador"
  }))
end

function K.completion()
  local cmp = require("cmp")
  local luasnip = require("luasnip")
  cmp.setup({
    mapping = cmp.mapping.preset.insert({
      ["<C-u>"] = cmp.mapping.scroll_docs(-4),
      ["<C-d>"] = cmp.mapping.scroll_docs(4),
      ["<C-Space>"] = cmp.mapping.complete(),
      ["<C-e>"] = cmp.mapping.abort(),
      ["<CR>"] = cmp.mapping.confirm({ select = false }),
      ["<Tab>"] = cmp.mapping(function(fallback)
        if cmp.visible() then
          cmp.select_next_item()
        elseif luasnip.expand_or_locally_jumpable() then
          luasnip.expand_or_jump()
        else
          fallback()
        end
      end, { "i", "s" }),
      ["<S-Tab>"] = cmp.mapping(function(fallback)
        if cmp.visible() then
          cmp.select_prev_item()
        elseif luasnip.jumpable(-1) then
          luasnip.jump(-1)
        else
          fallback()
        end
      end, { "i", "s" }),
    }),
  })
end

-- TODO: clean this shit
function K.noice()
  vim.keymap.set({ "n", "i", "s" }, "<C-d>", function()
    if not require("noice.lsp").scroll(4) then return "<C-d>" end
  end, { silent = true, expr = true })

  vim.keymap.set({ "n", "i", "s" }, "<C-u>", function()
    if not require("noice.lsp").scroll(-4) then return "<C-u>" end
  end, { silent = true, expr = true })
end

return K

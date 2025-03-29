local K = {}

local keymap = vim.keymap.set
local default_opts = { noremap = true, silent = true }

local n, i = "n", "i"

function K.init()
  K.git()
  K.lsp()
  K.null_ls()
  K.tree()
  K.telescope()
  K.tmux()
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

function K.tmux()
  keymap(n, "<C-h>",
    "<Cmd>lua require('nvim-tmux-navigation').NvimTmuxNavigateLeft()<CR>",
    vim.tbl_extend("force", default_opts, {
      desc = "Navegar a la izquierda"
    }))

  keymap(n, "<C-l>",
    "<Cmd>lua require('nvim-tmux-navigation').NvimTmuxNavigateRight()<CR>",
    vim.tbl_extend("force", default_opts, {
      desc = "Navegar a la derecha"
    }))

  keymap(n, "<C-j>",
    "<Cmd>lua require('nvim-tmux-navigation').NvimTmuxNavigateDown()<CR>",
    vim.tbl_extend("force", default_opts, {
      desc = "Navegar abajo"
    }))

  keymap(n, "<C-k>",
    "<Cmd>lua require('nvim-tmux-navigation').NvimTmuxNavigateUp()<CR>",
    vim.tbl_extend("force", default_opts, {
      desc = "Navegar arriba"
    }))

  keymap(n, "<C-\\>",
    "<Cmd>lua require('nvim-tmux-navigation').NvimTmuxNavigateLastActive()<CR>",
    vim.tbl_extend("force", default_opts, {
      desc = "Navegar al último panel activo"
    }))

  keymap(n, "<C-Space>",
    "<Cmd>lua require('nvim-tmux-navigation').NvimTmuxNavigateNext()<CR>",
    vim.tbl_extend("force", default_opts, {
      desc = "Navegar al siguiente panel"
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

return K

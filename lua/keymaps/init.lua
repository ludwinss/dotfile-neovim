local U = require("utils")
local M = {}

local keymap = vim.keymap.set
local default_opts = { noremap = true, silent = true }

local n, i, v, t = "n", "i", "v", "t"
local ex_t = { n, i, v }
local n_i = { n, i }
local n_v = { n, v }

local allow_remap = { noremap = false, silent = true }

function M.init()
  -- M.debugger()
  M.editing()
  M.git()
  M.lsp()
  M.native()
  M.noice()
  M.null_ls()
  M.oil()
  M.telescope()
  M.editing()
  M.zenmode()
  M.completion()
end

function M.native()
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

  keymap(n, "<Esc>", "<Cmd>noh<CR>", vim.tbl_extend("force", allow_remap, {
    desc = "Limpiar highlights"
  }))
  keymap(n_v, "<C-e>", "j<C-e>", vim.tbl_extend("force", default_opts, {
    desc = "Desplazar hacia abajo"
  }))
  keymap(n_v, "<C-y>", "k<C-y>", vim.tbl_extend("force", default_opts, {
    desc = "Desplazar hacia arriba"
  }))
  keymap(n, "K", "<nop>", vim.tbl_extend("force", default_opts, {
    desc = "Desactivar K"
  }))
  keymap(n, "<leader>d", function()
    require("native.lsp-native").toggle_virtual_diagnostics()
    default_opts = { noremap = true, silent = true, desc = "Desactivar diagnósticos virtuales" }
  end, default_opts)
  keymap(n, "<leader>f", function()
    require("native.lsp-native").toggle_format_enabled()
    default_opts = { noremap = true, silent = true, desc = "Desactivar formateo" }
  end, default_opts)
  keymap(n, "gm", "<Cmd>vertical Man<CR>", vim.tbl_extend("force", default_opts, {
    desc = "Ver página de manual"
  }))
end

function M.editing()
  keymap(i, "<Esc>", "<Esc>`^", default_opts)
  keymap(ex_t, "<C-s>", function()
    require("keymaps.utils").save_file()
  end, default_opts)
  keymap(v, "<Esc>", "v", default_opts)
  keymap(v, "i", "I", default_opts)
  keymap(n, "s", function()
    require("leap").leap({})
    default_opts = { noremap = true, silent = true, desc = "Saltar hacia adelante" }
  end)
  keymap(n, "S", function()
    require("leap").leap({ backward = true })
    default_opts = { noremap = true, silent = true, desc = "Saltar hacia atrás" }
  end)
end

--TODO: dont touch
function M.git()
  keymap(n, "<leader>v", function()
      require("keymaps.utils").toggle_diffview()
    end,
    vim.tbl_extend("force", default_opts, {
      desc = "Ver diffview"
    }))

  keymap(n, "<leader>b", "<Cmd>GitBlameToggle<CR>",
    vim.tbl_extend("force", default_opts, {
      desc = "Culpa"
    }))
end

function M.lsp()
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

  -- keymap(n, "RR", function()
  --   pcall(vim.lsp.buf.rename)
  -- end, vim.tbl_extend("force", default_opts, {
  --   desc = "Renombrar símbolo"
  -- }))
  --
  -- keymap(n, "gi", "<Cmd>Telescope lsp_implementations<CR>", vim.tbl_extend("force", default_opts, {
  --   desc = "Buscar implementaciones"
  -- }))
  --
  -- keymap(n, "gh", function()
  --   pcall(vim.lsp.buf.hover)
  -- end, vim.tbl_extend("force", default_opts, {
  --   desc = "Documentación flotante"
  -- }))
  --
  -- keymap(n_i, "<C-\\>", function()
  --   pcall(vim.lsp.buf.signature_help)
  -- end, vim.tbl_extend("force", default_opts, {
  --   desc = "Ayuda de firma"
  -- }))
  --
  -- keymap(n, "ge", function()
  --   require("native.lsp-native").open_diagnostics_float()
  -- end, vim.tbl_extend("force", default_opts, {
  --   desc = "Ventana flotante de diagnósticos"
  -- }))
  --
  -- keymap(n, "[e", function()
  --   require("native.lsp-native").prev_diag()
  -- end, vim.tbl_extend("force", default_opts, {
  --   desc = "Diagnóstico anterior"
  -- }))
  --
  -- keymap(n, "]e", function()
  --   require("native.lsp-native").next_diag()
  -- end, vim.tbl_extend("force", default_opts, {
  --   desc = "Siguiente diagnóstico"
  -- }))
  --
  -- keymap(n, "[E", function()
  --   require("native.lsp-native").prev_error()
  -- end, vim.tbl_extend("force", default_opts, {
  --   desc = "Error anterior"
  -- }))
  --
  -- keymap(n, "]E", function()
  --   require("native.lsp-native").next_error()
  -- end, vim.tbl_extend("force", default_opts, {
  --   desc = "Siguiente error"
  -- }))
  --
  -- keymap(n, "<leader>l", "<Cmd>LspInfo<CR>", vim.tbl_extend("force", default_opts, {
  --   desc = "Ver información de LSP"
  -- }))
end

function M.null_ls()
  keymap(n, "<leader>gf", function()
    return vim.lsp.buf.format({
      async = true,
      -- TODO : Cambiar a null-ls
      -- filter = function(client) return client.name == "eslint" end
    })
  end, vim.tbl_extend("force", default_opts, {
    desc = "Formatear archivo"
  }))
end

function M.telescope()
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

  keymap(n, "fh", function()
    require("telescope.builtin").help_tags({})
  end, vim.tbl_extend("force", default_opts, {
    desc = "Ver páginas de ayuda"
  }))

  keymap(n, "z=", function()
    require("telescope.builtin").spell_suggest({})
  end, vim.tbl_extend("force", default_opts, {
    desc = "Sugerencias de ortografía"
  }))

  keymap(n, "fk", function()
    require("telescope.builtin").keymaps({})
  end, vim.tbl_extend("force", default_opts, {
    desc = "Ver keymaps"
  }))

  keymap(n, "fj", function()
    require("telescope.builtin").jumplist({ cwd = vim.loop.cwd() })
  end, vim.tbl_extend("force", default_opts, {
    desc = "Ver jumplist"
  }))

  keymap(n, "fm", function()
    require("telescope.builtin").man_pages({ sections = { "ALL" } })
  end, vim.tbl_extend("force", default_opts, {
    desc = "Ver páginas de manual"
  }))

  keymap(n, "fo", function()
    require("telescope.builtin").oldfiles({ cwd = vim.loop.cwd() })
  end, vim.tbl_extend("force", default_opts, {
    desc = "Archivos recientes (cwd)"
  }))

  keymap(n, "fO", function()
    require("telescope.builtin").oldfiles({ cwd = vim.fn.expand("~") })
  end, vim.tbl_extend("force", default_opts, {
    desc = "Archivos recientes (home)"
  }))

  keymap(n, "ff", function()
    require("telescope.builtin").find_files({})
  end, vim.tbl_extend("force", default_opts, {
    desc = "Buscar archivos (cwd)"
  }))

  keymap(n, "fF", function()
    require("telescope.builtin").find_files({ cwd = vim.fn.expand("~") })
  end, vim.tbl_extend("force", default_opts, {
    desc = "Buscar archivos (home)"
  }))

  keymap(n, "<C-f>", function()
    require("telescope.builtin").current_buffer_fuzzy_find({
      previewer = false,
      results_ts_highlight = false,
      wrap_results = false,
    })
  end, vim.tbl_extend("force", default_opts, {
    desc = "Buscar texto en buffer actual"
  }))

  keymap(n, "fG", "<Cmd>Telescope live_grep disable_coordinates=true<CR>", vim.tbl_extend("force", default_opts, {
    desc = "Live grep global"
  }))

  keymap(n, "<C-n>", "<Cmd>Telescope buffers previewer=false<CR>", vim.tbl_extend("force", default_opts, {
    desc = "Ver buffers abiertos"
  }))

  keymap(n, "fd", "<Cmd>Telescope diagnostics line_width=full bufnr=0<CR>", vim.tbl_extend("force", default_opts, {
    desc = "Diagnósticos buffer actual"
  }))

  keymap(n, "fD", "<Cmd>Telescope diagnostics line_width=full<CR>", vim.tbl_extend("force", default_opts, {
    desc = "Diagnósticos globales"
  }))

  keymap(n_v, "fg", function()
    require("telescope.builtin").registers()
  end, vim.tbl_extend("force", default_opts, {
    desc = "Ver registros"
  }))

  keymap(n, "ft", "<Cmd>TodoTelescope previewer=false wrap_results=false<CR>", vim.tbl_extend("force", default_opts, {
    desc = "Ver TODOs"
  }))

  keymap(
    n,
    "fT",
    "<Cmd>TodoTelescope previewer=false wrap_results=false cwd=" .. U.get_git_root() .. "<CR>",
    vim.tbl_extend("force", default_opts, {
      desc = "Ver TODOs (root)"
    })
  )

  keymap(n, "fs", "<Cmd>Telescope lsp_document_symbols<CR>", vim.tbl_extend("force", default_opts, {
    desc = "Símbolos de documento"
  }))

  keymap(n, "gr", "<Cmd>Telescope lsp_references<CR>", vim.tbl_extend("force", default_opts, {
    desc = "Referencias LSP"
  }))

  keymap(n, "gd", "<Cmd>Telescope lsp_definitions<CR>", vim.tbl_extend("force", default_opts, {
    desc = "Definiciones LSP"
  }))
end

function M.completion()
  local cmp = require("cmp")
  local luasnip = require("luasnip")
  cmp.setup({
    mapping = cmp.mapping.preset.insert({
      ["<C-u>"] = cmp.mapping.scroll_docs(-4),
      ["<C-d>"] = cmp.mapping.scroll_docs(4),
      ["<C-Space>"] = cmp.mapping.complete(),
      ["q"] = cmp.mapping.abort(),
      ["<CR>"] = cmp.mapping.confirm({ select = false }),
      ["j"] = cmp.mapping(function(fallback)
        if cmp.visible() then
          cmp.select_next_item()
        elseif luasnip.expand_or_locally_jumpable() then
          luasnip.expand_or_jump()
        else
          fallback()
        end
      end, { "i", "s" }),
      ["k"] = cmp.mapping(function(fallback)
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

function M.debugger()
  keymap(n, "<C-b>", "<Cmd>DapToggleBreakpoint<CR>",
    vim.tbl_extend("force", default_opts, {
      desc = "Poner breakpoint"
    }))

  keymap(n, "<leader>s", function()
    require("keymaps.utils").dap_float_scope()
  end, vim.tbl_extend("force", default_opts, {
    desc = "Ver variables locales"
  }))

  keymap(n, "<F1>", function()
    require("keymaps.utils").dap_toggle_ui()
  end, vim.tbl_extend("force", default_opts, {
    desc = "Abrir UI de debugger"
  }))

  keymap(n, "<F2>", "<Cmd>DapContinue<CR>",
    vim.tbl_extend("force", default_opts, {
      desc = "Continuar debugger"
    }))

  keymap(n, "<Right>", "<Cmd>DapStepInto<CR>",
    vim.tbl_extend("force", default_opts, {
      desc = "Entrar en función"
    }))

  keymap(n, "<Down>", "<Cmd>DapStepOver<CR>",
    vim.tbl_extend("force", default_opts, {
      desc = "Saltar función"
    }))

  keymap(n, "<Left>", "<Cmd>DapStepOut<CR>",
    vim.tbl_extend("force", default_opts, {
      desc = "Saltar función"
    }))

  keymap(n, "<Up>", "<Cmd>DapRestartFrame<CR>",
    vim.tbl_extend("force", default_opts, {
      desc = "Reiniciar frame"
    }))
end

-- TODO: dont touch
function M.zenmode()
  keymap(n, "<leader>z", "<Cmd>ZenMode<CR>", vim.tbl_extend("force", default_opts, {
    desc = "Activar/Desactivar Zen Mode"
  }))
end

-- TODO: dont touch
function M.oil()
  keymap(n, "<leader>e", function()
      require("keymaps.utils").toggle_oil()
    end,
    vim.tbl_extend("force", default_opts, {
      desc = "Abrir explorador de archivos"
    })
  )
end

function M.noice()
  keymap({ "n", "i", "s" }, "<C-d>", function()
    if not require("noice.lsp").scroll(4) then return "<C-d>" end
  end, vim.tbl_extend("force", default_opts, {
    expr = true,
    desc = "Desplazar contenido (down)"
  }))

  keymap({ "n", "i", "s" }, "<C-u>", function()
    if not require("noice.lsp").scroll(-4) then return "<C-u>" end
  end, vim.tbl_extend("force", default_opts, {
    expr = true,
    desc = "Desplazar contenido (up)"
  }))
end

return M

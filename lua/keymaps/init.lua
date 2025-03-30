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
    M.git()
    M.lsp()
    M.native()
    M.null_ls()
    M.telescope()
    M.editing()
    M.tree()
    M.noice()
    M.debugger()
    M.oil()
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

    -- Misc
    keymap(n, "<Esc>", "<Cmd>noh<CR>", allow_remap)
    keymap(n_v, "<C-e>", "j<C-e>", default_opts)
    keymap(n_v, "<C-y>", "k<C-y>", default_opts)
    keymap(n, "K", "<nop>", default_opts)
    keymap(n, "<leader>d", function()
        require("alex.native.lsp").toggle_virtual_diagnostics()
    end, default_opts)
    keymap(n, "<leader>f", function()
        require("alex.native.lsp").toggle_format_enabled()
    end, default_opts)
    keymap(n, "gm", "<Cmd>vertical Man<CR>", default_opts)
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
    end)
    keymap(n, "S", function()
        require("leap").leap({ backward = true })
    end)
    keymap(n, "<leader>v", function()
        require("keymaps.utils").toggle_diffview()
    end)
end

function M.git()
    keymap(n, "<leader>gt", "<Cmd>GitBlameToggle<CR>",
        vim.tbl_extend("force", default_opts, {
            desc = "Ver quién modificó esta línea"
        }))
    keymap(n, "<leader>gp", ":Gitsigns preview_hunk<CR>",
        vim.tbl_extend("force", default_opts, {
            desc = "Ver cambios del hunk actual"
        }))

    keymap(n, "<leader>gs", ":Gitsigns stage_hunk<CR>",
        vim.tbl_extend("force", default_opts, {
            desc = "Staggear hunk actual"
        }))
end

function M.lsp()
    keymap(n, "M", vim.lsp.buf.hover,
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

    keymap(n, "RR", function()
        pcall(vim.lsp.buf.rename)
    end, default_opts)
    keymap(n, "gi", "<Cmd>Telescope lsp_implementations<CR>", default_opts)
    keymap(n, "gh", function()
        pcall(vim.lsp.buf.hover)
    end, default_opts)
    keymap(n_i, "<C-\\>", function()
        pcall(vim.lsp.buf.signature_help)
    end, default_opts)

    keymap(n, "ge", function()
        require("alex.native.lsp").open_diagnostics_float()
    end, default_opts)
    keymap(n, "[e", function()
        require("alex.native.lsp").prev_diag()
    end, default_opts)
    keymap(n, "]e", function()
        require("alex.native.lsp").next_diag()
    end, default_opts)
    keymap(n, "[E", function()
        require("alex.native.lsp").prev_error()
    end, default_opts)
    keymap(n, "]E", function()
        require("alex.native.lsp").next_error()
    end, default_opts)

    keymap(n, "<leader>l", "<Cmd>LspInfo<CR>", default_opts)
end

function M.null_ls()
    keymap(n, "<leader>gf", function()
        return vim.lsp.buf.format({ async = true })
    end, vim.tbl_extend("force", default_opts, {
        desc = "Formatear archivo"
    }))
end

function M.tree()
    vim.api.nvim_set_keymap(n, '<C-n>', ':NvimTreeToggle<CR>',
        vim.tbl_extend("force", default_opts, {
            desc = "Abrir árbol de archivos"
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
    end)
    keymap(n, "z=", function()
        require("telescope.builtin").spell_suggest({})
    end)
    keymap(n, "fk", function()
        require("telescope.builtin").keymaps({})
    end)
    keymap(n, "fj", function()
        require("telescope.builtin").jumplist({ cwd = vim.loop.cwd() })
    end)
    keymap(n, "fm", function()
        require("telescope.builtin").man_pages({ sections = { "ALL" } })
    end)

    keymap(n, "fo", function()
        require("telescope.builtin").oldfiles({ cwd = vim.loop.cwd() })
    end, default_opts)
    keymap(n, "fO", function()
        require("telescope.builtin").oldfiles({ cwd = vim.fn.expand("~") })
    end, default_opts)
    keymap(n, "ff", function()
        require("telescope.builtin").find_files({})
    end)
    keymap(n, "fF", function()
        require("telescope.builtin").find_files({ cwd = vim.fn.expand("~") })
    end, default_opts)
    keymap(n, "<C-f>", function()
        require("telescope.builtin").current_buffer_fuzzy_find({
            previewer = false,
            results_ts_highlight = false,
            wrap_results = false,
        })
    end, default_opts)

    keymap(n, "fG", "<Cmd>Telescope live_grep disable_coordinates=true<CR>", default_opts)

    keymap(n, "<C-n>", "<Cmd>Telescope buffers previewer=false<CR>", default_opts)
    keymap(n, "fd", "<Cmd>Telescope diagnostics line_width=full bufnr=0<CR>", default_opts)
    keymap(n, "fD", "<Cmd>Telescope diagnostics line_width=full<CR>", default_opts)

    keymap(n_v, "fg", function()
        require("telescope.builtin").registers()
    end, default_opts)

    keymap(n, "ft", "<Cmd>TodoTelescope previewer=false wrap_results=false<CR>", default_opts)
    keymap(
        n,
        "fT",
        "<Cmd>TodoTelescope previewer=false wrap_results=false cwd=" .. U.get_git_root() .. "<CR>",
        default_opts
    )

    -- For LSP.
    keymap(n, "fs", "<Cmd>Telescope lsp_document_symbols<CR>", default_opts)
    keymap(n, "gr", "<Cmd>Telescope lsp_references<CR>", default_opts)
    keymap(n, "gd", "<Cmd>Telescope lsp_definitions<CR>", default_opts)
end

function M.completion()
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

function M.debugger()
    keymap(n, "<C-b>", "<Cmd>DapToggleBreakpoint<CR>",
        vim.tbl_extend("force", default_opts, {
            desc = "Poner breakpoint"
        }))

    keymap(n, "<leader>s", function()
        require("alex.keymaps.utils").dap_float_scope()
    end, vim.tbl_extend("force", default_opts, {
        desc = "Ver variables locales"
    }))

    keymap(n, "<F1>", function()
        require("alex.keymaps.utils").dap_toggle_ui()
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

function M.oil()
    keymap(n, "<leader>e", function()
        require("alex.keymaps.utils").toggle_oil()
    end)
    require("oil").setup({
        keymaps = {
            ["<CR>"] = "actions.select",
            ["-"] = "actions.parent",
        },
        use_default_keymaps = false,
    })
end

-- TODO: clean this shit
function M.noice()
    keymap({ "n", "i", "s" }, "<C-d>", function()
        if not require("noice.lsp").scroll(4) then return "<C-d>" end
    end, { silent = true, expr = true })

    keymap({ "n", "i", "s" }, "<C-u>", function()
        if not require("noice.lsp").scroll(-4) then return "<C-u>" end
    end, { silent = true, expr = true })
end

return M

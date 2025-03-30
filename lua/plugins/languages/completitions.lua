local CMP = require("cmp")
local U = require("utils")

require("plugins.ui.nvim-cmp")
require("luasnip.loaders.from_vscode").lazy_load()

local sources = CMP.config.sources({
  { name = "nvim_lsp" },
  { name = "luasnip" },
  { name = "path" },
})
local snippet = {
  expand = function(args) require("luasnip").lsp_expand(args.body) end,
}
CMP.setup({
  sources = sources,
  snippet = snippet,
})

local tex = {
  sources = {
    { name = "nvim_lsp" },
    { name = "luasnip" },
    { name = "latex_symbols" },
  },
}
CMP.setup.filetype({ "tex", "latex" }, tex)

local cmdline_window = {
  completion = CMP.config.window.bordered({
    winhighlight = "Normal:Pmenu,FloatBorder:SpecialCmpBorder,Search:None",
    scrollbar = true,
    border = U.get_border_chars("cmdline"),
    col_offset = -4,
    side_padding = 0,
  }),
}
local cmdline = {
  window = cmdline_window,
  mapping = CMP.mapping.preset.cmdline(),
  sources = CMP.config.sources({
    { name = "cmdline" },
    { name = "path" },
  }),
}
CMP.setup.cmdline({ ":", ":!" }, cmdline)

local search_window = {
  completion = CMP.config.window.bordered({
    winhighlight = "Normal:Pmenu,FloatBorder:SpecialCmpBorder,Search:None",
    scrollbar = true,
    border = U.get_border_chars("search"),
    col_offset = -1,
    side_padding = 0,
  }),
}
local search = {
  window = search_window,
  mapping = CMP.mapping.preset.cmdline(),
  sources = CMP.config.sources({ { name = "buffer" } }),
}
CMP.setup.cmdline({ "/", "?" }, search)

-- TODO: clean this shit
-- require("keymaps").completion()

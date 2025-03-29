local UI = {}

UI.bottom_thin = "▁"

UI.border_chars_top_only = { "", UI.top_thin, "", "", "", " ", "", "" }
UI.border_chars_outer_thin = { "🭽", "▔", "🭾", "▕", "🭿", "▁", "🭼", "▏" }
UI.border_chars_round = { "╭", "─", "╮", "│", "╯", "─", "╰", "│" }
UI.border_chars_outer_thin_telescope = { "▔", "▕", "▁", "▏", "🭽", "🭾", "🭿", "🭼" }

UI.kind_icons = {
    Text = " ",
    Method = " ",
    Function = "󰊕 ",
    Constructor = " ",
    Field = " ",
    Variable = " ",
    Class = "󰠱 ",
    Interface = " ",
    Module = "󰏓 ",
    Property = " ",
    Unit = " ",
    Value = " ",
    Enum = " ",
    EnumMember = " ",
    Keyword = "󰌋 ",
    Snippet = "󰲋 ",
    Color = " ",
    File = " ",
    Reference = " ",
    Folder = " ",
    Constant = "󰏿 ",
    Struct = "󰠱 ",
    Event = " ",
    Operator = " ",
    TypeParameter = "󰘦 ",
    TabNine = "󰚩 ",
    Copilot = " ",
    Unknown = " ",
}

function UI.get_border_chars(desc)
  local U = require("utils.nvim")

  if desc == "completion" then return UI.border_chars_round end
  if desc == "cmdline" then return UI.border_chars_round end
  if desc == "search" then return UI.border_chars_round end
  if desc == "float" then return UI.border_chars_outer_thin end
  if desc == "telescope" then return UI.border_chars_outer_thin_telescope end

  if desc == "lsp" then
    if U.is_nordic() then return UI.border_chars_outer_thin end
    return UI.border_chars_round
  end

  if U.is_nordic() then return UI.border_chars_outer_thin end
  if U.is_tokyonight() then return UI.border_chars_round end

  return UI.border_chars_round
end

return UI

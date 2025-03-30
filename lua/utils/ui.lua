local UI = {}
local U = require("utils.nvim")

UI.bottom_thin = "▁"
UI.top_thin = "▔"
UI.left_thin = "▏"
UI.right_thin = "▕"
UI.left_thick = "▎"
UI.right_thick = "🮇"
UI.full_block = "█"
UI.top_right_thin = "🭾"
UI.top_left_thin = "🭽"
UI.bottom_left_thin = "🭼"
UI.bottom_right_thin = "🭿"
UI.top_left_round = "╭"
UI.top_right_round = "╮"
UI.bottom_right_round = "╯"
UI.bottom_left_round = "╰"
UI.vertical_default = "│"
UI.horizontal_default = "─"

UI.border_chars_top_only = { "", UI.top_thin, "", "", "", " ", "", "" }
UI.border_chars_outer_thin = { "🭽", "▔", "🭾", "▕", "🭿", "▁", "🭼", "▏" }
UI.border_chars_round = { "╭", "─", "╮", "│", "╯", "─", "╰", "│" }

UI.border_helix_telescope = { "─", "│", "─", "│", "┌", "┐", "┘", "└" }
UI.border_chars_outer_thick_telescope = { "▀", "▐", "▄", "▌", "▛", "▜", "▟", "▙" }
UI.border_chars_outer_thin_telescope = { "▔", "▕", "▁", "▏", "🭽", "🭾", "🭿", "🭼" }
UI.border_chars_telescope_default = { "─", "│", "─", "│", "╭", "╮", "╯", "╰" }
UI.border_chars_telescope_prompt_thin = { "▔", "▕", " ", "▏", "🭽", "🭾", "▕", "▏" }
UI.border_chars_telescope_vert_preview_thin =
    { " ", "▕", "▁", "▏", "▏", "▕", "🭿", "🭼" }


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

UI.diagnostic_signs = {
  error = " ",
  warning = " ",
  warn = " ",
  info = " ",
  information = " ",
  hint = " ",
  other = " ",
}

function UI.get_border_chars(desc)
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

function UI.get_recording_state_icon()
  if U.is_recording() then
    return UI.kind_icons.Recording
  else
    return UI.kind_icons.None
  end
end

return UI

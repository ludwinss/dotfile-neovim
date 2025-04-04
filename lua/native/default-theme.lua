local M = {}

local U = require("utils.nvim")

local transparent = false

local function get_bg(color)
  return transparent and "NONE" or color
end

M.palette = {
  red = "#f08080",
  green = "#b3f6c0",
  yellow = "#fce094",
  magenta = "#ffcaff",
  orange = "#ffa07a",
  blue = "#87cefa",
  cyan = "#8cf8f7",

  black = "#07080d",
  gray0 = "#14161b",
  gray1 = "#2c2e33",
  gray2 = "#4f5258",

  white0 = "#eef1f8",
  white1 = "#e0e2ea",
  white2 = "#c4c6cd",
  white3 = "#9b9ea4",
}
M.palette.fg = M.palette.white0
M.palette.bg = M.palette.gray0
M.palette.bg_dark = M.palette.black

function M.init()
  U.set_highlights_table({
    -- Git
    Added = { fg = M.palette.green },
    Removed = { fg = M.palette.red },
    Changed = { fg = M.palette.blue },
    Normal = { bg = get_bg(M.palette.bg) },

    -- Native UI.
    Visual = { bg = M.palette.gray1 },
    WinBar = { fg = M.palette.white2, bg = get_bg(M.palette.bg) },
    WinBarNC = { fg = M.palette.white2, bg = get_bg(M.palette.bg) },
    Pmenu = { link = "Normal" },
    WinSeparator = { fg = M.palette.bg_dark, bg = get_bg(M.palette.bg) },
    NormalFloat = { fg = M.palette.fg, bg = get_bg(M.palette.bg) },
    FloatBorder = { fg = M.palette.fg, bg = get_bg(M.palette.bg) },
    LineNR = { fg = M.palette.gray2, bg = get_bg(M.palette.bg) },
    CursorLineNR = { fg = M.palette.white0, bg = get_bg(M.palette.bg), bold = true },
    QuickFixFilename = { fg = M.palette.fg },
    QuickFixLine = { fg = M.palette.fg },
    LspInfoBorder = { link = "FloatBorder" },

    -- Syntax tweaks.
    MatchParen = { bg = get_bg(M.palette.bg), underline = true },
    Statement = { fg = M.palette.orange, bold = false },
    Comment = { fg = M.palette.gray2, bold = false },
    Title = { fg = M.palette.yellow, bold = true },
    Constant = { bold = false },
    ["@markup.heading.2"] = { fg = M.palette.orange, bold = true },
    ["@markup.heading.3"] = { fg = M.palette.orange },
    ["@markup.heading.4"] = { link = "@markup.heading.3" },
    ["@markup.heading.5"] = { link = "@markup.heading.3" },
    ["@markup.heading.6"] = { link = "@markup.heading.3" },
    Number = { fg = M.palette.magenta },
    Boolean = { fg = M.palette.magenta },

    -- Indent blankline.
    IndentBlanklineChar = { fg = M.palette.gray1 },
    IndentBlanklineContextChar = { link = "IndentBlanklineChar" },

    -- Diagnostics.
    DiagnosticError = { fg = M.palette.red },
    DiagnosticWarn = { fg = M.palette.yellow },
    DiagnosticHint = { fg = M.palette.green },
    DiagnosticOk = { fg = M.palette.green },
    DiagnosticInfo = { fg = M.palette.blue },
    DiagnosticUnderlineError = { sp = M.palette.red, underline = true, undercurl = false },
    DiagnosticUnderlineWarn = { sp = M.palette.yellow, underline = true, undercurl = false },
    DiagnosticUnderlineHint = { sp = M.palette.green, underline = true, undercurl = false },
    DiagnosticUnderlineOk = { sp = M.palette.green, underline = true, undercurl = false },
    DiagnosticUnderlineInfo = { sp = M.palette.blue, underline = true, undercurl = false },
    DiagnosticVirtualTextError = {
      fg = M.palette.red,
      bg = get_bg(M.palette.bg),
      underline = true,
    },
    DiagnosticVirtualTextWarn = {
      fg = M.palette.yellow,
      bg = get_bg(M.palette.bg),
      underline = true,
    },
    DiagnosticVirtualTextHint = {
      fg = M.palette.green,
      bg = get_bg(M.palette.bg),
      underline = true,
    },
    DiagnosticVirtualTextOk = {
      fg = M.palette.green,
      bg = get_bg(M.palette.bg),
      underline = true,
    },
    DiagnosticVirtualTextInfo = {
      fg = M.palette.blue,
      bg = get_bg(M.palette.bg),
      underline = true,
    },

    -- Whichkey.
    WhichKeyNormal = { bg = M.palette.bg_dark },
    WhichKeyTitle = { bg = M.palette.bg_dark, fg = M.palette.yellow, bold = true },
    WhichKeyBorder = { bg = M.palette.bg_dark, fg = M.palette.bg_dark },

    -- Dashboard.
    DashboardHeader = { fg = M.palette.yellow },
    DashboardFooter = { fg = M.palette.cyan },
    DashboardProjectTitle = { fg = M.palette.orange },
    DashboardMruTitle = { fg = M.palette.orange },

    -- Tree.
    NvimTreeModifiedIcon = { fg = M.palette.gray2 },
    NvimTreeGitDirtyIcon = { link = "NvimTreeModifiedIcon" },
    NvimTreeGitStagedIcon = { link = "NvimTreeModifiedIcon" },
    NvimTreeGitDeletedIcon = { link = "NvimTreeModifiedIcon" },
    NvimTreeGitIgnoredIcon = { link = "NvimTreeModifiedIcon" },
    NvimTreeGitNewIcon = { link = "NvimTreeModifiedIcon" },
    NvimTreeGitRenamedIcon = { link = "NvimTreeModifiedIcon" },
    NvimTreeRootFolder = { fg = M.palette.white3 },
    NvimTreeSpecialFile = { fg = M.palette.yellow, bold = false },

    -- Telescope.
    TelescopePromptPrefix = { fg = M.palette.yellow, bg = get_bg(M.palette.bg) },
    TelescopeTitle = { fg = M.palette.bg_dark, bg = M.palette.orange },

    -- Notify.
    NotifyINFOTitle = { fg = M.palette.green },
    NotifyINFOIcon = { fg = M.palette.green },
    NotifyINFOBorder = { fg = M.palette.green },
    NotifyINFOBody = { fg = M.palette.fg },
    NotifyWARNTitle = { fg = M.palette.yellow },
    NotifyWARNIcon = { fg = M.palette.yellow },
    NotifyWARNBorder = { fg = M.palette.yellow },
    NotifyWARNBody = { fg = M.palette.fg },
    NotifyERRORTitle = { fg = M.palette.red },
    NotifyERRORIcon = { fg = M.palette.red },
    NotifyERRORBorder = { fg = M.palette.red },
    NotifyERRORBody = { fg = M.palette.fg },
    NotifyBackground = { bg = get_bg(M.palette.bg) },

    -- Noice.
    NoiceCmdlinePopupBorder = { fg = M.palette.cyan },
    NoiceFormatProgressDone = { bg = M.palette.green },
    NoiceCmdlineIcon = { fg = M.palette.yellow },

    -- Todo comments
    TodoFgTODO = { fg = M.palette.cyan, bold = true },

    -- Lazy.
    LazyProgressDone = { fg = M.palette.green },

    -- HACK:
    luaParenError = { link = "Normal" },
    markdownError = { link = "Normal" },
  })
end

function M.setup_lualine()
  local default_section = { fg = M.palette.gray2, bg = M.palette.bg_dark }
  local default = {
    normal = {
      a = { fg = M.palette.bg_dark, bg = M.palette.blue, gui = "bold" },
      b = default_section,
      c = default_section,
    },
    visual = {
      a = { fg = M.palette.bg_dark, bg = M.palette.red, gui = "bold" },
      b = default_section,
      c = default_section,
    },
    replace = {
      a = { fg = M.palette.bg_dark, bg = M.palette.red, gui = "bold" },
      b = default_section,
      c = default_section,
    },
    command = {
      a = { fg = M.palette.bg_dark, bg = M.palette.orange, gui = "bold" },
      b = default_section,
      c = default_section,
    },
    insert = {
      a = { fg = M.palette.bg_dark, bg = M.palette.green, gui = "bold" },
      b = default_section,
      c = default_section,
    },
    inactive = {
      a = { fg = M.palette.bg_dark, bg = M.palette.gray0, gui = "bold" },
      b = default_section,
      c = default_section,
    },
    terminal = {
      a = { fg = M.palette.bg_dark, bg = M.palette.gray0, gui = "bold" },
      b = default_section,
      c = default_section,
    },
  }
  require("lualine").setup({
    options = { theme = default },
  })
end

M.init()

return M

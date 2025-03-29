local UI = require("utils.ui")
local plugins = require("plugins.plugins")

local opts = {
  ui = { border = UI.border_chars_outer_thin },
  defaults = { lazy = false },
  checker = {
    notify = false,
    enabled = true,
  },
}

require("lazy").setup(plugins, opts)

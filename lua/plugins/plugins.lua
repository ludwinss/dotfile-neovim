return {
  {
    "nvim-telescope/telescope.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-lua/popup.nvim",
    },
    cmd = "Telescope",
    config = function() require("plugins.ui.telescope") end,
  },
  {
    "nvim-lualine/lualine.nvim",
    dependencies = {
      "nvim-tree/nvim-web-devicons",
      "AndreM222/copilot-lualine",
    },
    event = { "User NvimStartupDone" },
    config = function() require("plugins.ui.lualine") end,
  },
  {
    "nvim-treesitter/nvim-treesitter",
    dependencies = {
      "nvim-treesitter/nvim-treesitter-textobjects",
      "nvim-treesitter/playground",
    },
    event = { "User NvimStartupDone" },
    build = { ":TSUpdate" },
    config = function() require("plugins.ui.treesitter") end,
  },
  {
    "folke/which-key.nvim",
    event = { "User NvimStartupDone" },
    config = function() require("plugins.ui.wich-key") end,
  },
  -- THEMES
  {
    "AlexvZyl/nordic.nvim",
    priority = 1000,
    config = function() require("plugins.themes.nordic") end,
    lazy = false,
  },
  {
    "folke/tokyonight.nvim",
    lazy = true,
    priority = 1000,
    config = function() require("plugins.themes.tokyonight") end,
  },
  {
    "sainnhe/gruvbox-material",
    lazy = true,
    priority = 1000,
  },

}

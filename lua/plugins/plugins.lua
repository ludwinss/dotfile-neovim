return {
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
    branch = "dev",
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

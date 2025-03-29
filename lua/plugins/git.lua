return {
  {
    "tpope/vim-fugitive"
  },
  {
    "lewis6991/gitsigns.nvim",
    config = function()
      require("gitsigns").setup()
    end
  },
  -- THEMES
  {
    "AlexvZyl/nordic.nvim",
    branch = "dev",
    priority = 1000,
    config = function() require("alex.plugins.themes.nordic") end,
    lazy = true,
  },
  {
    "folke/tokyonight.nvim",
    priority = 1000,
    lazy = false,
    config = function() require("alex.plugins.themes.tokyonight") end,
  },
  {
    "sainnhe/gruvbox-material",
    lazy = true,
    priority = 1000,
    config = function() require("alex.plugins.themes.gruvbox") end,
  },

}

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
  }
}

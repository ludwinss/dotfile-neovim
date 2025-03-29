return {
  "AlexvZyl/nordic.nvim",
  lazy = false,
  priority = 1000,
  config = function()
    require("nordic").setup({
      italic_comments = true,
      transparent = {
        bg = false,
        float = false,
      },
    })
    require("nordic").load()
  end,
}

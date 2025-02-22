return {
  "catppuccin/nvim",
  lazy = false,
  priority = 1000,
  config = function()
    require("catppuccin").setup({
      flavour = "macchiato",
      transparent_background = false,
      show_end_of_buffer = false,
      term_colors = true,
    })
  end,
}

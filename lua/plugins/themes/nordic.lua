require("nordic").setup({
  italic_comments = true,
  transparent = {
    bg = false,
    float = false,
  },
})

require("nordic").load({
  cursorline = {
    theme = "dark",
  }
})

require("lualine").setup({
  options = { theme = "nordic" },
})

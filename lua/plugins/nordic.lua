return {
  "AlexvZyl/nordic.nvim",
  lazy = false,
  priority = 1000,
  config = function()
    require("nordic").setup({
      on_highlights = function(highlights, palette)
        print(highlights)
        highlights.Normal = { fg = palette.gray5 }
        highlights.Comment = { fg = palette.gray3, italic = true }
      end,
      italic_comments = true,
      transparent = {
        bg = false,
        float = false,
      },
    })

    require("nordic").load()
  end,
}

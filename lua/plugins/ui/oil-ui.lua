local oil = require("oil")

oil.setup({
  default_file_explorer = true,
  columns = {
    "icon",
  },
  float = {
    padding = 2,
    max_width = 80,
    max_height = 30,
    border = "rounded",
    win_options = {
      winblend = 0,
    },
  },
  keymaps = {
    ["<CR>"] = "actions.select",
    ["-"] = "actions.parent",
  },
  use_default_keymaps = false,
  view_options = {
    show_hidden = true,
    is_always_hidden = function(name, _)
      return name == ".." or name == ".git"
    end,
  },
})

vim.api.nvim_create_autocmd("FileType", {
  pattern = "oil",
  callback = function()
    vim.keymap.set("n", "q", "<cmd>bd!<CR>", { buffer = true, desc = "Cerrar Oil" })
  end,
})


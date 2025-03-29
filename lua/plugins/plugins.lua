return {
  -- LANGUAGES
  {
    "rmagatti/auto-session",
    config = function() require("plugins.languages.sessions") end,
  },
  {
    "neovim/nvim-lspconfig",
    config = function() require("plugins.languages.lsp-config") end,
    lazy = false,
  },
  {
    "folke/lazydev.nvim",
    ft = "lua",
    dependencies = { "Bilal2453/luvit-meta" },
  },
  {
    "williamboman/mason-lspconfig.nvim",
    lazy = false,
    config = function() require("plugins.languages.mason-lsp") end,
  },
  {
    "williamboman/mason.nvim",
    lazy = false,
    build = ":MasonUpdate",
    config = function()
      require("mason").setup()
    end,
  },
  {
    "hrsh7th/nvim-cmp",
    event = { "User NvimStartupDone" },
    config = function() require("plugins.languages.completitions") end,
    dependencies = {
      "hrsh7th/cmp-omni",
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-path",
      "hrsh7th/cmp-cmdline",
      "saadparwaiz1/cmp_luasnip",
      {
        "L3MON4D3/LuaSnip",
        dependencies = { "rafamadriz/friendly-snippets" },
        build = "make install_jsregexp",
      },
    },
  },
  {
    "nvim-treesitter/nvim-treesitter",
    dependencies = {
      "nvim-treesitter/nvim-treesitter-textobjects",
      "nvim-treesitter/playground",
    },
    event = { "User NvimStartupDone" },
    build = { ":TSUpdate" },
    config = function() require("plugins.languages.treesitter") end,
  },
  -- UI
  {
    "glepnir/dashboard-nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function() require("plugins.ui.dashboard") end,
    lazy = false,
    priority = 999,
  },
  {
    "folke/todo-comments.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-telescope/telescope.nvim",
    },
    config = function() require("plugins.ui.todo") end,
    event = { "User NvimStartupDone" },
  },
  {
    "nvim-tree/nvim-web-devicons",
    config = function() require("plugins.ui.nvim-web-devicons") end,
  },
  {
    "NvChad/nvim-colorizer.lua",
    event = { "User NvimStartupDone" },
    config = function() require("plugins.ui.colorizer") end,
  },
  {
    "folke/noice.nvim",
    dependencies = { "MunifTanjim/nui.nvim", "rcarriga/nvim-notify" },
    event = { "User NvimStartupDone" },
    config = function() require("plugins.ui.noice") end,
  },
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
    "folke/which-key.nvim",
    event = { "User NvimStartupDone" },
    config = function() require("plugins.ui.wich-key") end,
  },
  {
    "lewis6991/gitsigns.nvim",
    event = { "User NvimStartupDone" },
    config = function() require("plugins.ui.gitsigns") end,
  },
  {
    "f-person/git-blame.nvim",
    cmd = { "GitBlameToggle" },
  },
  {
    "lukas-reineke/indent-blankline.nvim",
    event = { "VeryLazy" },
    config = function() require("plugins.ui.indent-blankline") end,
  },
  {
    "sindrets/diffview.nvim",
    cmd = { "DiffviewClose", "DiffviewOpen" },
    config = function() require("plugins.ui.diffview") end,
  },
  {
    "nvim-tree/nvim-tree.lua",
    version = "*",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function() require("plugins.ui.tree") end,
    keys = { "<leader>f", "gf" },
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
  -- OTHER.
  {
    "github/copilot.vim",
    config = function() require("plugins.languages.copilot") end,
  },
  {
    "aserowy/tmux.nvim",
    event = { "User NvimStartupDone" },
    config = function() require("tmux").setup() end,
  },
  {
    "vyfor/cord.nvim",
    build = "./build || .\\build",
    event = "VeryLazy",
  },
  {
    "ggandor/leap.nvim",
    dependencies = "tpope/vim-repeat",
    keys = { "s", "S" },
    config = function() require("plugins.ui.leap") end,
  },
  {
    "kawre/leetcode.nvim",
    build = ":TSUpdate html",
    dependencies = {
      "nvim-telescope/telescope.nvim",
      "nvim-lua/plenary.nvim",
      "MunifTanjim/nui.nvim",
      "nvim-treesitter/nvim-treesitter",
      "rcarriga/nvim-notify",
      "nvim-tree/nvim-web-devicons",
    },
    config = function() require("plugins.languages.leetcode") end
  },
  {
    "nvim-tree/nvim-tree.lua",
    version = "*",
    lazy = false,
    dependencies = {
      "nvim-tree/nvim-web-devicons",
    },
    config = function()
      vim.g.loaded_netrw = 1
      vim.g.loaded_netrwPlugin = 1

      vim.opt.termguicolors = true

      local HEIGHT_RATIO = 0.8 -- You can change this
      local WIDTH_RATIO = 0.5  -- You can change this too

      require('nvim-tree').setup {
        disable_netrw = true,
        hijack_netrw = true,
        respect_buf_cwd = true,
        sync_root_with_cwd = true,
        view = {
          relativenumber = true,
          float = {
            enable = true,
            open_win_config = function()
              local screen_w = vim.opt.columns:get()
              local screen_h = vim.opt.lines:get() - vim.opt.cmdheight:get()
              local window_w = screen_w * WIDTH_RATIO
              local window_h = screen_h * HEIGHT_RATIO
              local window_w_int = math.floor(window_w)
              local window_h_int = math.floor(window_h)
              local center_x = (screen_w - window_w) / 2
              local center_y = ((vim.opt.lines:get() - window_h) / 2)
                  - vim.opt.cmdheight:get()
              return {
                border = "rounded",
                relative = "editor",
                row = center_y,
                col = center_x,
                width = window_w_int,
                height = window_h_int,
              }
            end,
          },
          width = function()
            return math.floor(vim.opt.columns:get() * WIDTH_RATIO)
          end,
        },
        update_focused_file = {
          enable = true,
          update_root = true,
          ignore_list = {},
        },
      }
    end
  }


}

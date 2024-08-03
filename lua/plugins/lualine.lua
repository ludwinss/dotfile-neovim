return {
  'nvim-lualine/lualine.nvim',
  dependencies = { 'nvim-tree/nvim-web-devicons' },
  config = function()
    local C = require("nordic.colors")
    local text_hl = { fg = C.gray3 }
    local icon_hl = { fg = C.gray4 }
    local green = C.green.base
    local yellow = C.yellow.base
    local red = C.red.base

    local fmt_mode = function(mode)
      -- Define your fmt_mode function here
      return mode
    end

    local get_recording_color = function()
      -- Define your get_recording_color function here
      return { fg = C.blue }
    end

    local diff_source = function()
      -- Define your diff_source function here
      return { added = 0, modified = 0, removed = 0 }
    end

    require('lualine').setup({
      sections = {
        lualine_a = {
          {
            "mode",
            fmt = fmt_mode,
            icon = { "" },
            separator = { right = " ", left = "" },
          },
        },
        lualine_b = {},
        lualine_c = {
          {
            function() return '' end,  -- Empty component to avoid nil value
            color = get_recording_color,
            padding = 0,
            separator = "",
          },
          {
            "branch",
            color = text_hl,
            icon = { " ", color = icon_hl },
            separator = "",
            padding = 0,
          },
          {
            function() return '' end,  -- Empty component to avoid nil value
            padding = { left = 1 },
            color = text_hl,
            separator = "",
          },
          {
            "diff",
            color = text_hl,
            icon = { "  ", color = text_hl },
            source = diff_source,
            symbols = {
              added = " ",
              modified = " ",
              removed = " ",
            },
            diff_color = {
              added = icon_hl,
              modified = icon_hl,
              removed = icon_hl,
            },
            padding = 0,
          },
        },
        lualine_x = {
          {
            "diagnostics",
            sources = { "nvim_diagnostic" },
            symbols = {
              error = " ",
              warn = " ",
              info = " ",
              hint = "󱤅 ",
              other = "󰠠 ",
            },
            colored = true,
            padding = 2,
          },
          {
            function() return '' end,  -- Empty component to avoid nil value
            padding = 1,
            color = text_hl,
            icon = { " ", color = icon_hl },
          },
          {
            "copilot",
            padding = 1,
            color = icon_hl,
            show_colors = true,
            symbols = {
              status = {
                icons = {
                  enabled = " ",
                  disabled = " ",
                  warning = " ",
                  unknown = " ",
                },
                hl = {
                  enabled = green,
                  disabled = icon_hl.fg,
                  warning = yellow,
                  unknown = icon_hl.fg,
                },
              },
              spinners = { " " },
              spinner_color = green,
            },
          },
        },
        lualine_y = {},
        lualine_z = {
          {
            "location",
            icon = { "", align = "left" },
          },
          {
            "progress",
            icon = { "", align = "left" },
            separator = { right = "", left = "" },
          },
        },
      },
      options = {
        disabled_filetypes = { "dashboard" },
        globalstatus = true,
        section_separators = { left = " ", right = " " },
        component_separators = { left = "", right = "" },
      },
      extensions = {
        ["nvim-tree"] = "tree",
      },
    })
  end
}


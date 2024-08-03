return {
  'nvim-lualine/lualine.nvim',
  dependencies = { 'nvim-tree/nvim-web-devicons' },
  config = function()
    local U = require("utils")
    
    -------- Define colors theme installed in Nvim -----------------
    local text_hl
    local icon_hl
    local green
    local yellow
    local red
    
    local C
    
    if vim.g.colors_name == "nordic" then
      C = require("nordic.colors")
    elseif vim.g.colors_name == "tokyonight-night" then
      C = require("tokyonight.colors.moon")
    end

    if C then
      if vim.g.colors_name == "nordic" then
        text_hl = { fg = C.gray3 }
        icon_hl = { fg = C.gray4 }
        green = C.green.base
        yellow = C.yellow.base
        red = C.red.base
      elseif vim.g.colors_name == "tokyonight-night" then
        text_hl = { fg = C.fg_gutter }
        icon_hl = { fg = C.dark3 }
        green = C.green1
        yellow = C.yellow
        red = C.red1
      end
    else
      print("Error: Theme not supported")
    end
    --------------------------------------------------------------------

    ---------- Renamed commands --------------------------------------
    local function fmt_mode(s)
       local mode_map = {
           ["COMMAND"] = "COMMND",
           ["V-BLOCK"] = "VBLOCK",
           ["TERMINAL"] = "TERMNL",
           ["V-REPLACE"] = "VREPLC",
           ["O-PENDING"] = "0PNDNG",
       }
       return mode_map[s] or s
    end
    --------------------------------------------------------------------

    local function get_recording_color()
        if U.is_recording() then
            return { fg = red }
        else
            return { fg = text_hl }
        end
    end

    local function diff_source()
        local gitsigns = vim.b.gitsigns_status_dict
        if gitsigns then
            return {
                added = gitsigns.added,
                modified = gitsigns.changed,
                removed = gitsigns.removed,
            }
        end
    end
    
    local function get_short_cwd() return vim.fn.fnamemodify(vim.fn.getcwd(), ":~") end
    
    local tree = {
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
                    get_short_cwd,
                    padding = 0,
                    icon = { "   ", color = icon_hl },
                    color = text_hl,
                },
            },
            lualine_x = {},
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
        filetypes = { "NvimTree" },
    }
    
    local function telescope_text() return "Telescope" end
    
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
                U.get_recording_icon,
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
                U.get_git_compare,
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
                U.current_buffer_lsp,
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
           telescope,
           ["nvim-tree"] = tree,
       },
    })
  end
}


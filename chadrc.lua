local M = {}

M.ui = {
  hl_override = {
    -- better color scheme for diff
    DiffAdd =    {fg = "NONE", bg = "#31392b"},
    DiffChange = {fg = "NONE", bg = "#1c3448"},
    DiffDelete = {fg = "NONE", bg = "#382b2c"},
    DiffText =   {fg = "NONE", bg = "#2c5372"},
  },
  hl_add = {
    TerminalBackground =   {bg = "#0a0c0f"},
  },
  statusline = {
    theme = "default",
    separator_style = "block",
    overriden_modules = function()
      local st_modules = require "nvchad_ui.statusline.default"
      return {
        cursor_position = function()
          local line = vim.fn.line('.')
          local col = vim.fn.virtcol('.')
          local pos = string.format('%3d:%-2d', line, col)
          return st_modules.cursor_position() .. pos .. ' '
        end
      }
    end,
  }
}

M.plugins = "custom.plugins"
M.mappings = require "custom.mappings"

return M

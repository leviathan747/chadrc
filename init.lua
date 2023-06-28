-- turn on relative numbering by default
vim.opt.relativenumber = true

-- set up terminal windows
vim.api.nvim_create_autocmd({'TermOpen'}, {
  callback = function(_)
    -- turn off numbering
    vim.opt.relativenumber = false
    vim.opt.number = false
    -- set background color
    vim.api.nvim_set_option_value('winhl', 'Normal:TerminalBackground', {win = vim.api.nvim_get_current_win()})
  end,
})


-- turn on relative numbering by default
vim.opt.relativenumber = true

-- set up terminal windows
vim.api.nvim_create_autocmd({ "TermOpen" }, {
	callback = function(_)
		-- turn off numbering
		vim.opt.relativenumber = false
		vim.opt.number = false
		-- set background color
    print("HI LEVI")
		vim.api.nvim_set_option_value("winhl", "Normal:TerminalBackground", { win = vim.api.nvim_get_current_win() })
	end,
})

-- TODO clean this up
-- local dap = require('dap')
-- local dapui = require('dapui')
-- local dapp = require('dap-python')
-- vim.keymap.set('n', '<leader>b', dap.toggle_breakpoint)
-- vim.keymap.set('n', '<leader>c', dap.continue)
-- vim.keymap.set('n', '<leader>tm', dapp.test_method)
-- vim.keymap.set('n', '<leader>db', dapui.toggle) vim.keymap.set('n', 's', dap.step_over)
-- vim.keymap.set('n', 'si', dap.step_into)
-- vim.keymap.set('n', 'so', dap.step_out)
-- vim.keymap.set('n', 'R', dap.run_to_cursor)
-- vim.keymap.set('n', 'T', dap.terminate)
-- dap.listeners.after.event_initialized['dapui_config'] = dapui.open

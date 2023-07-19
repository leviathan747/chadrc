-- turn on relative numbering by default
vim.opt.relativenumber = true

-- set up terminal windows
vim.api.nvim_create_autocmd({ "TermOpen" }, {
	callback = function(_)
		-- turn off numbering
		vim.opt.relativenumber = false
		vim.opt.number = false
		-- set background color
		vim.api.nvim_set_option_value("winhl", "Normal:TerminalBackground", { win = vim.api.nvim_get_current_win() })
	end,
})

function EscapePair()
	local closers = { ")", "]", "}", ">", "'", '"', "`", "," }
	local line = vim.api.nvim_get_current_line()
	local row = vim.fn.line(".")
	local col = vim.fn.virtcol(".")
	local after = line:sub(col + 1, -1)
	local closer_col = #after + 1
	local closer_i = nil
	for i, closer in ipairs(closers) do
		local cur_index, _ = after:find(closer)
		if cur_index and (cur_index < closer_col) then
			closer_col = cur_index
			closer_i = i
		end
	end
	if closer_i then
		vim.api.nvim_win_set_cursor(0, { row, col + closer_col })
	else
		vim.api.nvim_win_set_cursor(0, { row, col + 1 })
	end
end

vim.api.nvim_set_keymap("i", "<C-l>", "<cmd>lua EscapePair()<CR>", { noremap = true, silent = true })

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

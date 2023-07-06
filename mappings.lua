local M = {}

M.general = {

	n = {
		["H"] = { "<C-w>2<", "Window left" },
		["L"] = { "<C-w>2>", "Window right" },
		["J"] = { "<C-w>2+", "Window down" },
		-- ["K"] = { "<C-w>2-", "Window up" }, TODO
		["<leader>zz"] = { "<C-z>", "Suspend Vim" },
		["<leader>h"] = { "<C-w>h", "Window left" },
		["<leader>l"] = { "<C-w>l", "Window right" },
		["<leader>j"] = { "<C-w>j", "Window down" },
		["<leader>k"] = { "<C-w>k", "Window up" },
	},

	t = {
		["<Esc>"] = { vim.api.nvim_replace_termcodes("<C-\\><C-N>", true, true, true), "Escape terminal mode" },
	},
}

M.nvterm = {

	n = {
		["<leader>t"] = {
			function()
				require("nvterm.terminal").toggle("float")
			end,
			"Toggle horizontal term",
		},
	},
}

M.nvimtree = {
	plugin = true,

	n = {
		["<leader>tn"] = { "<cmd> NvimTreeToggle <CR>", "Toggle nvimtree" },
	},
}

return M

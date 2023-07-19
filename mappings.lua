local M = {}

M.general = {

	n = {
		["H"] = { "<C-w>2<", "Window left" },
		["L"] = { "<C-w>2>", "Window right" },
		["J"] = { "<C-w>2+", "Window down" },
		-- ["K"] = { "<C-w>2-", "Window up" }, TODO
		-- ["<leader>zz"] = { "<C-z>", "Suspend Vim" },
		-- ["<leader>h"] = { "<C-w>h", "Window left" },
		-- ["<leader>l"] = { "<C-w>l", "Window right" },
		-- ["<leader>j"] = { "<C-w>j", "Window down" },
		-- ["<leader>k"] = { "<C-w>k", "Window up" },
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
	t = {
		["<Esc>"] = { vim.api.nvim_replace_termcodes("<C-\\><C-N>", true, true, true), "Escape terminal mode" },
	},
}

M.nvimtree = {
	plugin = true,

	n = {
		["<leader>nt"] = { "<cmd> NvimTreeToggle <CR>", "Toggle nvimtree" },
	},
}

M.disabled = {
	n = {
		["<leader>th"] = "",  -- disable theme selection so terminal is immediate
		["<leader>td"] = "",  -- disable toggle deleted
	},
}

return M

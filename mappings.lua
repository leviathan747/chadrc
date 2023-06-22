local M = {}

M.general = {

  n = {
    ["H"] = { "<C-w>2>", "Window left" },
    ["L"] = { "<C-w>2<", "Window right" },
    ["J"] = { "<C-w>2+", "Window down" },
    ["K"] = { "<C-w>2-", "Window up" },
    ["<leader>zz"] = { "<C-z>", "Suspend Vim" },
  },

  t = {
    ["<Esc>"] = { vim.api.nvim_replace_termcodes("<C-\\><C-N>", true, true, true), "Escape terminal mode" },
  },

}

M.nvimtree = {
  plugin = true,

  n = {
    ["<leader>tn"] = { "<cmd> NvimTreeToggle <CR>", "Toggle nvimtree" },
  },
}

return M

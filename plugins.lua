local plugins = {

  {
    "lewis6991/gitsigns.nvim",
    opts = function()
      local opts = {
        signs = {
          delete = { text = "_" },
        },
      }
      return vim.tbl_deep_extend("force", require("plugins.configs.others").gitsigns, opts)
    end,
  },

}

return plugins

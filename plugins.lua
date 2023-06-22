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

  -- Disable nvim-cmp plugin
  {
    "hrsh7th/nvim-cmp",
    -- config = function(_, _) end,
  },

  -- optimized fuzzy finding
  {
    'nvim-telescope/telescope-fzf-native.nvim',
    build = 'make',
    cond = function()
      return vim.fn.executable 'make' == 1
    end,
  },

  {
    'neovim/nvim-lspconfig',
    dependencies = {
      -- Useful status updates for LSP
      { 'j-hui/fidget.nvim', opts = {} },
    },
    config = function()
       require "plugins.configs.lspconfig"
       require "custom.configs.lspconfig"
    end,
  },

  -- default language servers
  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        "lua-language-server",
        "python-lsp-server",
        "debugpy",
      },
    },
  }

}

return plugins

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
    },
    config = function()
       require "plugins.configs.lspconfig"
       require "custom.configs.lspconfig"
    end,
  },

  -- Useful status updates for LSP
  {
		"j-hui/fidget.nvim",
		requires = { "neovim/nvim-lspconfig" },
		tag = "legacy",
		config = true,
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
  },

  'nvim-treesitter/nvim-treesitter-context',

  {
    "nvim-treesitter/nvim-treesitter",
    dependencies = {'nvim-treesitter/nvim-treesitter-context'},
  },

}

return plugins

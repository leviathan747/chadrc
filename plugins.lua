local plugins = {

	-- Optimized fuzzy finding
	{
		"nvim-telescope/telescope.nvim",
		dependencies = {
			{
				"nvim-telescope/telescope-fzf-native.nvim",
				build = "make",
				cond = function()
					return vim.fn.executable("make") == 1
				end,
			},
		},
	},

	-- Additional LSP config
	{
		"neovim/nvim-lspconfig",
		dependencies = {
			-- Useful status updates for LSP
			{
				"j-hui/fidget.nvim",
				tag = "legacy",
				config = true,
			},
			-- NULL-LS
			{
				"jose-elias-alvarez/null-ls.nvim",
				config = function()
					local null_ls = require("null-ls")
					null_ls.setup({
						sources = {
							null_ls.builtins.formatting.stylua,
							-- null_ls.builtins.completion.spell,
							null_ls.builtins.code_actions.gitsigns,
							null_ls.builtins.formatting.clang_format,
						},
					})
				end,
			},
			{
				"WhoIsSethDaniel/toggle-lsp-diagnostics.nvim",
				config = function()
					require("toggle_lsp_diagnostics").init()
				end,
			},
		},
		config = function()
			require("plugins.configs.lspconfig")
			require("custom.configs.lspconfig")
		end,
	},

	-- DAP setup TODO
	{
		"mfussenegger/nvim-dap",
		dependencies = {
			-- TODO (not set up)
			-- {
			--   'mfussenegger/nvim-dap-python',
			-- },
			-- {
			--   'rcarriga/nvim-dap-ui',
			-- },
		},
	},

	-- default language servers
	{
		"williamboman/mason.nvim",
		opts = {
			ensure_installed = {
				-- launguage servers
				"lua-language-server",
				"python-lsp-server",
				"clangd",
				-- debuggers
				"debugpy",
				-- code formatters
				"stylua",
				"clang-format",
			},
		},
	},

	-- Sticky context at the top
	{
		"nvim-treesitter/nvim-treesitter",
		dependencies = {
			{
				"nvim-treesitter/nvim-treesitter-context",
				config = function()
					require("treesitter-context").setup()
				end,
			},
		},
	},

	-- Customize git symbols
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

	-- fugitive
	{
		"tpope/vim-fugitive",
		lazy = false, -- TODO
	},

	-- Terminal sizing options
	{
		"NvChad/nvterm",
		opts = {
			terminals = {
				shell = vim.o.shell,
				type_opts = {
					float = {
						row = 0.4,
						col = 0.02,
						width = 0.96,
						height = 0.5,
					},
				},
			},
		},
	},

	-- open files from terimnal instances in current vim
	{
		"willothy/flatten.nvim",
		config = true,
		lazy = false,
		priority = 1001,
    enabled = false,  -- TODO not fully working
	},

  -- nvim tree sizing options
	{
		"nvim-tree/nvim-tree.lua",
		opts = function()
			local opts = {
				view = {
					adaptive_size = true,
					width = {
						min = 30,
						max = 50,
					},
				},
			}
			return vim.tbl_deep_extend("force", require("plugins.configs.nvimtree"), opts)
		end,
	},

  {
    "sindrets/diffview.nvim",
		config = true,
		lazy = false, -- TODO
  },

}

return plugins

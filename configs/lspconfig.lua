local on_attach = require("plugins.configs.lspconfig").on_attach
local capabilities = require("plugins.configs.lspconfig").capabilities
local lspconfig = require("lspconfig")

-- Python LSP setup
lspconfig.pylsp.setup({
	settings = {
		pylsp = {
			plugins = {
				pycodestyle = {
					ignore = { "E501" },
				},
			},
		},
	},
	on_attach = on_attach,
	capabilities = capabilities,
})

-- C/C++ LSP setup
lspconfig.clangd.setup({
	on_attach = on_attach,
	capabilities = capabilities,
})

-- Java LSP setup
-- lspconfig.java_language_server.setup({
-- 	on_attach = on_attach,
-- 	capabilities = capabilities,
--   -- TODO
-- 	cmd = {"/Users/levi/.local/share/nvim/mason/packages/java-language-server/dist/lang_server_mac.sh"},
-- })

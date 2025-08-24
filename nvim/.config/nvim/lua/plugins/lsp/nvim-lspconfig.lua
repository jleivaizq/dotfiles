-- nvim-lspconfig.lua
-- This plugin spec sets up LSP servers. It dynamically selects the correct TS server (ts_ls vs tsserver).
-- It also wires cmp_nvim_lsp capabilities so completion features are advertised to LSPs.

return {
	"neovim/nvim-lspconfig",
	config = function()
		-- Capabilities for nvim-cmp completion (snippet support, etc.)
		local capabilities = require("cmp_nvim_lsp").default_capabilities()

		-- Core lspconfig
		local lspconfig = require("lspconfig")

		-- Detect whether your installed nvim-lspconfig exposes "ts_ls" (new) or "tsserver" (legacy)
		local ts_server = lspconfig.ts_ls and "ts_ls" or "tsserver"

		-- Lua
		lspconfig.lua_ls.setup({
			capabilities = capabilities,
			-- You may add Lua-specific settings (e.g. for neodev) here if you need to.
		})

		-- TypeScript / JavaScript
		lspconfig[ts_server].setup({
			capabilities = capabilities,
			-- Add any tsserver/ts_ls settings here (e.g. single file support, preferences)
		})

		-- HTML
		lspconfig.html.setup({
			capabilities = capabilities,
		})

		-- Global LSP keymaps (keep them simple and discoverable)
		vim.keymap.set("n", "K", vim.lsp.buf.hover, { desc = "LSP: Hover" })
		vim.keymap.set("n", "gd", vim.lsp.buf.definition, { desc = "LSP: Go to definition" })
		vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, { desc = "LSP: Code actions" })
	end,
}

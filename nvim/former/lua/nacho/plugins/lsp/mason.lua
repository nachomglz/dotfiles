return {
	"williamboman/mason.nvim",
	dependencies = {
		"neovim/nvim-lspconfig",
		"williamboman/mason-lspconfig.nvim",
		"WhoIsSethDaniel/mason-tool-installer.nvim",
	},
	config = function()
		require("mason").setup({
			ui = {
				icons = {
					package_installed = "✓",
					package_pending = "➜",
					package_uninstalled = "✗",
				},
			},
		})

		require("mason-lspconfig").setup({
			ensure_installed = {
				"lua_ls",
				"ts_ls",
				"html",
				"cssls",
				"tailwindcss",
				"jsonls",
				"bashls",
				"dockerls",
				"prismals",
				"docker_compose_language_service",
				"graphql",
				"emmet_ls",
			},
			automatic_enable = true,
		})

		require("mason-tool-installer").setup({
			ensure_installed = {
				"prettier", -- prettier formatter
				"stylua", -- lua formatter
				"eslint_d",
			},
		})
	end,
}

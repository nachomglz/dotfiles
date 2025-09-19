return {
	{
		"mason-org/mason.nvim",
		dependencies = {
			"neovim/nvim-lspconfig",
			"mason-org/mason-lspconfig.nvim",
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
				automatic_installation = true,
			})

			require("mason-tool-installer").setup({
				ensure_installed = {
					"prettier", -- prettier formatter
					"stylua", -- lua formatter
					"eslint_d",
				},
			})
		end,
	},
	{
		"neovim/nvim-lspconfig",
		event = { "bufreadpre", "bufnewfile" },
		dependencies = {
			"mason-org/mason.nvim",
			"mason-org/mason-lspconfig.nvim",
			"hrsh7th/cmp-nvim-lsp",
			{ "folke/neodev.nvim", opts = {} },
		},
		config = function()
			local capabilities = require("cmp_nvim_lsp").default_capabilities()

			vim.lsp.config("*", { capabilities = capabilities })

			-- Set keymaps only when LSP attaches
			vim.api.nvim_create_autocmd("LspAttach", {
				group = vim.api.nvim_create_augroup("UserLspConfig", {}),
				callback = function(ev)
					local opts = { buffer = ev.buf, silent = true }

					-- set keybinds
					opts.desc = "Show LSP references"
					vim.keymap.set("n", "gR", "<cmd>Telescope lsp_references<CR>", opts) -- show definition, references

					opts.desc = "Go to declaration"
					vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts) -- go to declaration

					opts.desc = "Show LSP definitions"
					vim.keymap.set("n", "gd", function()
						require("telescope.builtin").lsp_definitions({ reuse_win = true })
					end, opts)

					opts.desc = "Show documentation for what is under cursor"
					vim.keymap.set("n", "K", vim.lsp.buf.hover, opts) -- show documentation for what is under cursor

					opts.desc = "Show LSP implementations"
					vim.keymap.set("n", "gi", "<cmd>Telescope lsp_implementations<CR>", opts) -- show lsp implementations

					opts.desc = "Show LSP type definitions"
					vim.keymap.set("n", "gt", "<cmd>Telescope lsp_type_definitions<CR>", opts) -- show lsp type definitions

					opts.desc = "See available code actions"
					vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, opts) -- see available code actions, in visual mode will apply to selection

					opts.desc = "Smart rename"
					vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts) -- smart rename

					opts.desc = "Show buffer diagnostics"
					vim.keymap.set("n", "<leader>D", "<cmd>Telescope diagnostics bufnr=0<CR>", opts) -- show  diagnostics for file

					opts.desc = "Show line diagnostics"
					vim.keymap.set("n", "<leader>d", vim.diagnostic.open_float, opts) -- show diagnostics for line

					opts.desc = "Go to previous diagnostic"
					vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, opts) -- jump to previous diagnostic in buffer

					opts.desc = "Go to next diagnostic"
					vim.keymap.set("n", "]d", vim.diagnostic.goto_next, opts) -- jump to next diagnostic in buffer

					opts.desc = "Restart LSP"
					vim.keymap.set("n", "<leader>rs", ":LspRestart<CR>", opts) -- mapping to restart lsp if necessary
				end,
			})

			-- Diagnostic configuration
			vim.diagnostic.config({
				virtual_text = true,
				float = { border = "rounded" },
				severity_sort = true,
			})

			-- Custom diagnostic signs
			local signs = { Error = " ", Warn = " ", Hint = "󰠠 ", Info = " " }
			for type, icon in pairs(signs) do
				local hl = "DiagnosticSign" .. type
				vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
			end
		end,
	},
}

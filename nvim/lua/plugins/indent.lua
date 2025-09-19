return {
	{
		"lukas-reineke/indent-blankline.nvim",
		event = { "BufReadPost", "BufNewFile" },
		opts = {
			indent = {
				char = "│",
				tab_char = "│",
			},
			scope = { enabled = false }, -- Disable since we'll use mini.indentscope
			exclude = {
				filetypes = {
					"help",
					"alpha",
					"dashboard",
					"neo-tree",
					"Trouble",
					"trouble",
					"lazy",
					"mason",
					"notify",
					"toggleterm",
				},
			},
		},
		main = "ibl",
	},

	-- Animated current scope highlighting
	{
		"echasnovski/mini.indentscope",
		event = { "BufReadPost", "BufNewFile" },
		opts = {
			symbol = "│",
			options = { try_as_border = true },
			animation = {
				enable = true,
				timing = 100,
				steps = 10,
			},
		},
		init = function()
			vim.api.nvim_create_autocmd("FileType", {
				pattern = {
					"help",
					"alpha",
					"dashboard",
					"neo-tree",
					"Trouble",
					"trouble",
					"lazy",
					"mason",
					"notify",
					"toggleterm",
				},
				callback = function()
					vim.b.miniindentscope_disable = true
				end,
			})
		end,
	},
}

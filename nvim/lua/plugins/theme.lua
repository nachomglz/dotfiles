return {
	{
		"rebelot/kanagawa.nvim",
		lazy = false,
		priority = 1000,
		config = function()
			require("kanagawa").setup({
				transparent = true,
				colors = {
					theme = {
						all = {
							ui = {
								bg_gutter = "none",
								float = { bg = "none", bg_border = "none" },
							},
						},
					},
				},
				overrides = function()
					return {
						TelescopeBorder = { bg = "none" },
						TabLineFill = { bg = "none" },
					}
				end,
			})
			vim.cmd.colorscheme("kanagawa")
		end,
	},
}

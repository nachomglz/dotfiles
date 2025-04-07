return {
	"lukas-reineke/indent-blankline.nvim",
	event = { "BufReadPre", "BufNewFile" },
	main = "ibl",
	opts = {
		indent = { char = "▎" },
	},
	config = function()
		local highlight = {
			"RainbowRed",
			"RainbowYellow",
			"RainbowBlue",
			"RainbowOrange",
			"RainbowGreen",
			"RainbowViolet",
			"RainbowCyan",
		}

		local hooks = require("ibl.hooks")
		hooks.register(hooks.type.HIGHLIGHT_SETUP, function()
			vim.api.nvim_set_hl(0, "RainbowRed", { fg = "#8B5A5A" }) -- Muted Red
			vim.api.nvim_set_hl(0, "RainbowYellow", { fg = "#A69662" }) -- Muted Yellow
			vim.api.nvim_set_hl(0, "RainbowBlue", { fg = "#4E7998" }) -- Muted Blue
			vim.api.nvim_set_hl(0, "RainbowOrange", { fg = "#A07052" }) -- Muted Orange
			vim.api.nvim_set_hl(0, "RainbowGreen", { fg = "#6F8C5E" }) -- Muted Green
			vim.api.nvim_set_hl(0, "RainbowViolet", { fg = "#8A699A" }) -- Muted Violet
			vim.api.nvim_set_hl(0, "RainbowCyan", { fg = "#45808B" }) -- Muted Cyan
		end)

		require("ibl").setup({ indent = { highlight = highlight } })
	end,
}

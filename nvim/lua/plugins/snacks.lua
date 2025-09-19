return {
	"folke/snacks.nvim",
	priority = 1000,
	lazy = false,
	opts = {
		bigfile = { enabled = true },
		statuscolumn = { enabled = true },
		words = { enabled = true },
		quickfile = { enabled = true },
		dashboard = { enabled = false }, -- disable since you might not want this
		notifier = { enabled = true },
		toggle = { enabled = true },
		zen = { enabled = true },
		scratch = { enabled = true },
		rename = { enabled = true },
		gitbrowse = { enabled = true },
		lazygit = { enabled = true },
		terminal = { enabled = true },
		win = { enabled = true },
	},
}

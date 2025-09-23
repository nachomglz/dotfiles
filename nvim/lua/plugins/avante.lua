return {
	"yetone/avante.nvim",
	build = "make",
	event = "VeryLazy",
	version = false,
	---@module 'avante'\
	---@type avante.Config
	opts = {
		instructions_file = "avante.md",
		provider = "claude",
		mode = "legacy",
		providers = {
			claude = {
				endpoint = "https://api.anthropic.com",
				model = "claude-sonnet-4-20250514",
				timeout = 30000,
				extra_request_body = {
					temperature = 0.7,
					max_tokens = 20480,
				},
			},
		},
		windows = {
			---@type "right" | "left" | "top" | "bottom"
			position = "right", -- the position of the sidebar
			wrap = true, -- similar to vim.o.wrap
			width = 30, -- default % based on available width
			sidebar_header = {
				enabled = true, -- true, false to enable/disable the header
				align = "center", -- left, center, right for title
				rounded = true,
			},
			spinner = {
				editing = {
					"⡀",
					"⠄",
					"⠂",
					"⠁",
					"⠈",
					"⠐",
					"⠠",
					"⢀",
					"⣀",
					"⢄",
					"⢂",
					"⢁",
					"⢈",
					"⢐",
					"⢠",
					"⣠",
					"⢤",
					"⢢",
					"⢡",
					"⢨",
					"⢰",
					"⣰",
					"⢴",
					"⢲",
					"⢱",
					"⢸",
					"⣸",
					"⢼",
					"⢺",
					"⢹",
					"⣹",
					"⢽",
					"⢻",
					"⣻",
					"⢿",
					"⣿",
				},
				generating = { "·", "✢", "✳", "∗", "✻", "✽" }, -- Spinner characters for the 'generating' state
				thinking = { "🤯", "🙄" }, -- Spinner characters for the 'thinking' state
			},
			input = {
				prefix = "> ",
				height = 8, -- Height of the input window in vertical layout
			},
			edit = {
				border = "rounded",
				start_insert = true, -- Start insert mode when opening the edit window
			},
			ask = {
				floating = false, -- Open the 'AvanteAsk' prompt in a floating window
				start_insert = true, -- Start insert mode when opening the ask window
				border = "rounded",
				---@type "ours" | "theirs"
				focus_on_apply = "ours", -- which diff to focus after applying
			},
		},
	},
	dependencies = {
		"nvim-lua/plenary.nvim",
		"MunifTanjim/nui.nvim",
		"echasnovski/mini.pick",
		"nvim-telescope/telescope.nvim",
		"hrsh7th/nvim-cmp",
		"ibhagwan/fzf-lua",
		"stevearc/dressing.nvim",
		"folke/snacks.nvim",
		"nvim-tree/nvim-web-devicons",
	},
}

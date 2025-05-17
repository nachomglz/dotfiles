return {
	"nvim-telescope/telescope.nvim",
	branch = "0.1.x",
	dependencies = {
		"nvim-lua/plenary.nvim",
		{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
		"nvim-tree/nvim-web-devicons",
	},
	config = function()
		local telescope = require("telescope")
		local actions = require("telescope.actions")
		local builtin = require("telescope.builtin")

		telescope.setup({
			defaults = {
				path_display = { "absolute" },
				mappings = {
					i = {
						["<C-k>"] = actions.move_selection_previous, -- move to prev result
						["<C-j>"] = actions.move_selection_next, -- move to next result
						["<C-q>"] = actions.send_selected_to_qflist + actions.open_qflist,
					},
				},
				file_ignore_patterns = {
					".git/",
					"node_modules/",
					"*[Cc]ache/",
					"*-cache*",
					".next/",
					"public/",
					"build/",
					"dist/",
				},
				layout_config = {
					prompt_position = "top",
					horizontal = {
						preview_width = 0.5,
						results_width = 0.5,
					},
					vertical = {
						width = 0.99,
						height = 0.4,
						prompt_position = "top",
					},
					flex = {
						flip_columns = 120,
					},
				},
				layout_strategy = "bottom_pane",
				sorting_strategy = "ascending",
				results_title = "Results",
				prompt_title = "Search",
				winblend = 0,
			},
		})

		telescope.load_extension("fzf")

		-- set keymaps
		local keymap = vim.keymap

		keymap.set(
			"n",
			"<leader>ff",
			"<cmd>Telescope find_files find_command=rg,--ignore,--hidden,--files<cr>",
			{ desc = "Fuzzy find files in current working dir" }
		)
		keymap.set("n", "<leader>fr", "<cmd>Telescope oldfiles<cr>", { desc = "Fuzzy find recent files" })
		keymap.set("n", "<leader>fs", "<cmd>Telescope live_grep<cr>", { desc = "Find string in currenr working dir" })
		keymap.set("n", "<leader>fc", "<cmd>Telescope grep_string<cr>", { desc = "Find string under cursor" })
		keymap.set("n", "<leader>fe", function()
			builtin.find_files({ no_ignore = true, hidden = true, search_file = ".env" })
		end, { desc = "Find env files" })
	end,
}

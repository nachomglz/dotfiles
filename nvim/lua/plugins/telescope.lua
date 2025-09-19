return {
	{
		"nvim-telescope/telescope.nvim",
		branch = "0.1.x",
		-- FIXME: use the new master branch and fix warnings and deprecation errors
		-- branch = "master",
		dependencies = {
			"nvim-lua/plenary.nvim",
			{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
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
						prompt_position = "bottom",
						horizontal = {
							preview_width = 0.5,
							results_width = 0.5,
						},
						vertical = {
							width = 0.99,
							height = 0.4,
							prompt_position = "bottom",
						},
						flex = {
							flip_columns = 120,
						},
					},
					sorting_strategy = "ascending",
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
			keymap.set(
				"n",
				"<leader><leader>",
				"<cmd>Telescope find_files find_command=rg,--ignore,--hidden,--files<cr>",
				{ desc = "Fuzzy find files in current working dir" }
			)
			keymap.set("n", "<leader>fr", "<cmd>Telescope oldfiles<cr>", { desc = "Fuzzy find recent files" })
			keymap.set(
				"n",
				"<leader>fs",
				"<cmd>Telescope live_grep<cr>",
				{ desc = "Find string in currenr working dir" }
			)
			keymap.set("n", "<leader>fc", "<cmd>Telescope grep_string<cr>", { desc = "Find string under cursor" })
			keymap.set("n", "<leader>fe", function()
				builtin.find_files({ no_ignore = true, hidden = true, search_file = ".env" })
			end, { desc = "Find env files" })

			keymap.set("n", "<leader>ft", function()
				vim.opt.background = "dark"

				-- Create the autocmd before opening telescope
				local group = vim.api.nvim_create_augroup("TelescopeColorscheme", { clear = true })
				vim.api.nvim_create_autocmd("ColorScheme", {
					group = group,
					callback = function()
						vim.opt.background = "dark"
						vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
						vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
					end,
				})

				vim.cmd("Telescope colorscheme")
			end, { desc = "Find available colorschemes" })
		end,
	},
	-- better vim.ui with telescope
	{
		"stevearc/dressing.nvim",
		lazy = true,
		init = function()
			---@diagnostic disable-next-line: duplicate-set-field
			vim.ui.select = function(...)
				require("lazy").load({ plugins = { "dressing.nvim" } })
				return vim.ui.select(...)
			end
			---@diagnostic disable-next-line: duplicate-set-field
			vim.ui.input = function(...)
				require("lazy").load({ plugins = { "dressing.nvim" } })
				return vim.ui.input(...)
			end
		end,
	},
}

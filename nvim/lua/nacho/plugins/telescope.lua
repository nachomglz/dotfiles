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

		-- Create custom action list
		local custom_actions = {
			{
				"Change Theme",
				function()
					-- Use Vim's completion to find all colorschemes
					local colorscheme_list = vim.fn.getcompletion("", "color")

					-- Create the Telescope picker
					local pickers = require("telescope.pickers")
					local finders = require("telescope.finders")
					local conf = require("telescope.config").values
					local actions = require("telescope.actions")
					local action_state = require("telescope.actions.state")

					-- Store original colorscheme
					local original_colorscheme = vim.g.colors_name or "default"

					pickers
						.new({}, {
							prompt_title = "Colorschemes",
							finder = finders.new_table({
								results = colorscheme_list,
							}),
							sorter = conf.generic_sorter({}),
							attach_mappings = function(prompt_bufnr, map)
								-- Function to preview the colorscheme
								local function preview_colorscheme()
									local selection = action_state.get_selected_entry(prompt_bufnr)
									if selection then
										-- Debug to see what's in the selection
										-- print(vim.inspect(selection))

										-- Try to apply the colorscheme - using the display value
										-- instead of assuming a specific structure
										pcall(vim.cmd, "colorscheme " .. selection[1])
									end
								end

								-- Apply colorscheme on selection
								actions.select_default:replace(function()
									local selection = action_state.get_selected_entry(prompt_bufnr)
									actions.close(prompt_bufnr)
									if selection then
										-- Apply the selected colorscheme permanently
										pcall(vim.cmd, "colorscheme " .. selection[1])
										-- Optionally print the selected theme
										print("Selected theme: " .. selection[1])
									end
								end)

								-- Register escape to restore the original colorscheme
								map("i", "<Esc>", function()
									actions.close(prompt_bufnr)
									-- Restore original colorscheme if user cancels
									pcall(vim.cmd, "colorscheme " .. original_colorscheme)
								end)

								-- Register change event for preview
								vim.api.nvim_create_autocmd("CursorMoved", {
									buffer = prompt_bufnr,
									callback = function()
										preview_colorscheme()
									end,
								})

								return true
							end,
						})
						:find()
				end,
			},
		}

		-- Create your main action list picker
		local function action_list()
			local pickers = require("telescope.pickers")
			local finders = require("telescope.finders")
			local conf = require("telescope.config").values
			local actions = require("telescope.actions")
			local action_state = require("telescope.actions.state")

			pickers
				.new({}, {
					prompt_title = "My Actions",
					finder = finders.new_table({
						results = custom_actions,
						entry_maker = function(entry)
							return {
								value = entry,
								display = entry[1],
								ordinal = entry[1],
							}
						end,
					}),
					sorter = conf.generic_sorter({}),
					attach_mappings = function(prompt_bufnr, map)
						actions.select_default:replace(function()
							actions.close(prompt_bufnr)
							local selection = action_state.get_selected_entry(prompt_bufnr)
							selection.value[2]() -- Execute the function
						end)
						return true
					end,
				})
				:find()
		end

		keymap.set("n", "<leader>fa", action_list, { desc = "Show Action List" })
	end,
}

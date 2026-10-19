return {
	{
		"nvim-telescope/telescope.nvim",
		branch = "master",
		dependencies = {
			"nvim-lua/plenary.nvim",
			{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
		},
		config = function()
			local telescope = require("telescope")
			local actions = require("telescope.actions")
			local builtin = require("telescope.builtin")
			local action_state = require("telescope.actions.state")

			-- Prune heavy dirs inside rg instead of letting telescope filter them in Lua.
			local always_excluded = {
				".git",
				"node_modules",
				".sst",
				".claude/worktrees",
				"out",
				".next",
				".turbo",
				"dist",
				"build",
				"coverage",
			}

			-- Only pruned in the "focus" scope; <C-a> inside the picker flips to "all".
			-- ".*/" matches hidden directories at any depth (.claude, .github, ...) but keeps dotfiles.
			local focus_excluded = {
				".*/",
				"*.lock",
				"*-lock.{json,yaml}",
				"*.map",
				"*.min.{js,css}",
				"*.snap",
				"*.{png,jpg,jpeg,gif,webp,ico,pdf,docx,pem,woff,woff2,ttf,otf}",
			}

			local function rg_globs(scope)
				local excluded =
					vim.list_extend(vim.deepcopy(always_excluded), scope == "focus" and focus_excluded or {})
				local args = {}
				for _, pattern in ipairs(excluded) do
					vim.list_extend(args, { "-g", "!" .. pattern })
				end
				return args
			end

			-- --no-ignore-vcs keeps gitignored generated sources (e.g. src/generated/) findable.
			local function find_command(scope)
				return vim.list_extend(
					{ "rg", "--files", "--hidden", "--no-ignore-vcs", "--color", "never" },
					rg_globs(scope)
				)
			end

			-- Focus grep still respects .gitignore so generated clients don't flood the results.
			local function grep_args(scope)
				local args = vim.list_extend({ "--hidden" }, rg_globs(scope))
				if scope == "all" then
					table.insert(args, "--no-ignore-vcs")
				end
				return args
			end

			local function scope_opts(picker, scope)
				if picker == "find_files" then
					return {
						find_command = function()
							return find_command(scope)
						end,
					}
				end
				return {
					additional_args = function()
						return grep_args(scope)
					end,
				}
			end

			local titles = { find_files = "Find Files", live_grep = "Live Grep", grep_string = "Grep String" }

			local function open_scoped(picker, scope, opts)
				opts = opts or {}
				builtin[picker](vim.tbl_extend("force", opts, scope_opts(picker, scope), {
					prompt_title = titles[picker] .. (scope == "all" and " (all)" or ""),
					attach_mappings = function(_, map)
						map({ "i", "n" }, "<C-a>", function(prompt_bufnr)
							local text = action_state.get_current_line()
							actions.close(prompt_bufnr)
							open_scoped(
								picker,
								scope == "focus" and "all" or "focus",
								vim.tbl_extend("force", opts, { default_text = text })
							)
						end)
						return true
					end,
				}))
			end

			local function scoped(picker, scope)
				return function()
					open_scoped(picker, scope)
				end
			end

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
						"%.git/",
						"node_modules/",
						"[Cc]ache/",
						"%-cache",
						"%.next/",
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
				pickers = {
					find_files = scope_opts("find_files", "focus"),
					live_grep = scope_opts("live_grep", "focus"),
					grep_string = scope_opts("grep_string", "focus"),
				},
			})

			telescope.load_extension("fzf")

			-- set keymaps
			local keymap = vim.keymap

			keymap.set(
				"n",
				"<leader>ff",
				scoped("find_files", "focus"),
				{ desc = "Fuzzy find files in current working dir" }
			)
			keymap.set(
				"n",
				"<leader><leader>",
				scoped("find_files", "focus"),
				{ desc = "Fuzzy find files in current working dir" }
			)
			keymap.set(
				"n",
				"<leader>fF",
				scoped("find_files", "all"),
				{ desc = "Fuzzy find all files (incl. hidden dirs)" }
			)
			keymap.set("n", "<leader>fr", "<cmd>Telescope oldfiles<cr>", { desc = "Fuzzy find recent files" })
			keymap.set("n", "<leader>fs", scoped("live_grep", "focus"), { desc = "Find string in current working dir" })
			keymap.set(
				"n",
				"<leader>fS",
				scoped("live_grep", "all"),
				{ desc = "Find string in all files (incl. hidden dirs)" }
			)
			keymap.set("n", "<leader>fc", scoped("grep_string", "focus"), { desc = "Find string under cursor" })
			keymap.set("n", "<leader>fe", function()
				builtin.find_files({
					find_command = find_command("all"),
					no_ignore = true,
					hidden = true,
					search_file = ".env",
				})
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

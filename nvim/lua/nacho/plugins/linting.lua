return {
	"mfussenegger/nvim-lint",
	event = {
		"BufReadPre",
		"BufNewFile",
	},
	config = function()
		local lint = require("lint")

		lint.linters_by_ft = {
			javascript = { "eslint_d" },
			typescript = { "eslint_d" },
			javascriptreact = { "eslint_d" },
			typescriptreact = { "eslint_d" },
		}

		local lint_augroup = vim.api.nvim_create_augroup("lint", { clear = true })

		vim.api.nvim_create_autocmd({ "BufEnter", "BufWritePost", "InsertLeave", "TextChanged" }, {
			group = lint_augroup,
			callback = function()
				lint.try_lint()
			end,
		})

		vim.keymap.set("n", "<leader>ll", function()
			lint.try_lint()
		end, { desc = "Trigger linting for current file" })

		vim.keymap.set("n", "<leader>lf", function()
			local filename = vim.api.nvim_buf_get_name(0)
			if filename == "" then
				vim.notify("No file to fix", vim.log.levels.WARN)
				return
			end

			-- Save the file first
			vim.cmd("write")

			-- Run eslint --fix
			local cmd = string.format("eslint_d --fix %s", vim.fn.shellescape(filename))
			vim.fn.system(cmd)

			-- Reload the buffer to show changes
			vim.cmd("edit!")

			vim.notify("ESLint autofix applied", vim.log.levels.INFO)
		end, { desc = "ESLint autofix current file" })
	end,
}

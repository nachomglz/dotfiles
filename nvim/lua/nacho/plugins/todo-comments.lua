return {
	"folke/todo-comments.nvim",
	dependencies = { "nvim-lua/plenary.nvim" },
	config = function()
		local keymap = vim.keymap
		local todo_comments = require("todo-comments")

		todo_comments.setup({
			highlight = {
				keyword = "fg",
			},
		})

		keymap.set("n", "<leader>ft", "<cmd>TodoTelescope<cr>", { desc = "Find all TODO's using Telescope" })
		keymap.set("n", "<leader>xt", "<cmd>TodoTrouble<cr>", { desc = "Find all TODO's using Trouble" })
	end,
}

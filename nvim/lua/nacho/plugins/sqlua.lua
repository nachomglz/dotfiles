return {
	"xemptuous/sqlua.nvim",
	lazy = true,
	cmd = "SQLua",
	config = function()
		require("sqlua").setup({
			db_save_location = "~/.local/share/nvim/sqlua/",
			connections_save_location = "~/.local/share/nvim/sqlua/connections.json",
			default_limit = 200,
			load_connections_on_start = false,
			keybinds = {
				execute_query = "<leader>eq",
				activate_db = "<C-a>",
			},
		})
	end,
}

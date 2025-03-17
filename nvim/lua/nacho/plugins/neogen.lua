return {
	"danymat/neogen",
	config = function()
		require("neogen").setup({})

		local keymap = vim.keymap

		keymap.set("n", "<Leader>nff", ":lua require('neogen').generate({ type = 'func' })<CR>")
		keymap.set("n", "<Leader>nfc", ":lua require('neogen').generate({ type = 'class' })<CR>")
		keymap.set("n", "<Leader>nft", ":lua require('neogen').generate({ type = 'type' })<CR>")
	end,
}

return {
	"kndndrj/nvim-dbee",
	dependencies = {
		"MunifTanjim/nui.nvim",
	},
	config = function()
		local dbee = require("dbee")

		dbee.setup({
			sources = {
				require("dbee.sources").MemorySource:new({
					{
						name = "datahub_shop_local",
						type = "postgres",
						url = "postgres://postgres:postgres@127.0.0.1:15434/shop_dev?sslmode=disable",
					},
				}),
			},
		})
	end,
}

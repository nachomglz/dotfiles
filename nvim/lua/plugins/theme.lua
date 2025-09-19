return {
	-- { "catppuccin/nvim", name = "catppuccin" },
	-- {
	-- 	"catppuccin/nvim",
	-- 	name = "catppuccin-latte",
	-- 	priority = 1000,
	-- 	config = function()
	-- 		require("catppuccin").setup({
	-- 			flavour = "latte", -- other options: "mocha", "frappe", "macchiato"
	-- 		})
	-- 		vim.cmd.colorscheme("catppuccin-latte")
	-- 	end,
	-- },
	-- { "neanias/everforest-nvim" },
	-- { "ellisonleao/gruvbox.nvim" },
	-- { "rebelot/kanagawa.nvim" },
	-- {
	-- 	"steve-lohmeyer/mars.nvim",
	-- 	name = "mars",
	-- },
	-- { "tahayvr/matteblack.nvim", lazy = false, priority = 1000 },
	{
    "EdenEast/nightfox.nvim", lazy = false, priority = 1000,
    config = function()
      require("nightfox").setup({})
    end,

  },
	-- {
	-- 	"ribru17/bamboo.nvim",
	-- 	lazy = false,
	-- 	priority = 1000,
	-- 	config = function()
	-- 		require("bamboo").setup({})
	-- 		require("bamboo").load()
	-- 	end,
	-- },
	-- {
	-- 	"gthelding/monokai-pro.nvim",
	-- 	config = function()
	-- 		require("monokai-pro").setup({
	-- 			filter = "ristretto",
	-- 			override = function()
	-- 				return {
	-- 					NonText = { fg = "#948a8b" },
	-- 					MiniIconsGrey = { fg = "#948a8b" },
	-- 					MiniIconsRed = { fg = "#fd6883" },
	-- 					MiniIconsBlue = { fg = "#85dacc" },
	-- 					MiniIconsGreen = { fg = "#adda78" },
	-- 					MiniIconsYellow = { fg = "#f9cc6c" },
	-- 					MiniIconsOrange = { fg = "#f38d70" },
	-- 					MiniIconsPurple = { fg = "#a8a9eb" },
	-- 					MiniIconsAzure = { fg = "#a8a9eb" },
	-- 					MiniIconsCyan = { fg = "#85dacc" }, -- same value as MiniIconsBlue for consistency
	-- 				}
	-- 			end,
	-- 		})
	-- 	end,
	-- },
	-- { "rose-pine/neovim", name = "rose-pine" },
	-- {
	-- 	"folke/tokyonight.nvim",
	-- 	priority = 1000,
	-- 	config = function()
	-- 		require("tokyonight").setup({
	-- 			style = "night",
	-- 			transparent = false, -- Let us handle transparency manually
	-- 			styles = {
	-- 				sidebars = "transparent",
	-- 				floats = "transparent",
	-- 			},
	-- 		})
	--
	-- 		-- Apply transparency after colorscheme loads
	-- 		vim.schedule(function()
	-- 			vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
	-- 			vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
	-- 			vim.api.nvim_set_hl(0, "NormalNC", { bg = "none" })
	-- 		end)
	-- 	end,
	-- },
}

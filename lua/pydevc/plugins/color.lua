return {
	"folke/tokyonight.nvim",
	lazy = false,
	priority = 1000,
	opts = {},
	config = function()
		local colors = require("tokyonight.colors").setup()
	end,
}

return {
	"theprimeagen/harpoon.nvim",

	config = function()
		local mark = require("harpoon.mark").setup({})
		local ui = require("harpoon.ui").setup({})

		vim.keymap.set("n", "<leader>a", mark.add_file)
		vim.keymap.set("n", "<C-e>", mark.toggle_quick_menu)

		vim.keymap.set("n", "<C-h>", function()
			ui.nav_file(1)
		end)
		vim.keymap.set("n", "<C-j>", function()
			ui.nav_file(2)
		end)
		vim.keymap.set("n", "<C-k>", function()
			ui.nav_file(3)
		end)
		vim.keymap.set("n", "<C-l>", function()
			ui.nav_file(4)
		end)
	end,
}

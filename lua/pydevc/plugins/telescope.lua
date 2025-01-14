return {
	"nvim-telescope/telescope.nvim",
	tag = "1.0.8",
	dependencies = {
		"nvim-lua/plenary.nvim",
	},

	config = function()
		local builtin = require("telescope.builtin").setup({
			vim.keymap.set("n", "<leader>pf", builtin.find_files, {}),
      vim.keymap.set("n", "<leader>gf", builtin.live_grep, {}),
      vim.keymap.set("n", "<C-i>", builtin.treesitter(), {}),
      -- use builtin.git_commits to open all commits in second window. Use function
      -- create a git tool kit in telescope but make sure the preview window in large enough and
      -- also allow word wrap for both file names and preview 
      vim.keymap.set("n", "<leader>cmd", function()
        builtin.command({ show_buf_command = vim.fn.input("CMD>>")})
      end),

      -- implement quick fix list
      vim.keymap.set("n", "<leader>ps", function()
        builtin.grep_string({ search = vim.fn.input("Grep>")})
      end),

      vim.keymap.set("n", "<leader>vh", builtin.help_tags, {}),

		})

    local defaults = require("telescope.defaults").setup({
    defaults.initial_mode = "normal",
    })
	end,
}

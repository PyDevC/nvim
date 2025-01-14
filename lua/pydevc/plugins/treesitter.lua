return {
	"nvim-treesitter/nvim-treesitter",
	config = function()
		require("nvim-treesitter.configs").setup({
			parser_install_dir = "./parser/",
			ensure_installed = { "c", "cpp", "lua", "markdown", "python" },
			sync_install = true,
			auto_install = true,

			-- Testing if it fits
			--[[
			keymaps = {
				init_selection = "",
				node_incremental = "",
				scope_incremental = "",
				node_decremental = "",
			},
      ]]
			--

			indent = {
				enable = true,
			},
		})
		local toggle = require("treesitter.toggle")
		-- Use when you learn to take query input in lua or neovim
		-- vim.keymaps.set("n", "<leader>syn", toggle.query, {})
	end,
}

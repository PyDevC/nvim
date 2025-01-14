return {
	"tpope/vim-fugitive",
	config = function()
		vim.keymap.set("n", "<leader>gs", vim.cmd.Git)
		local fugi = vim.api.nvim_create_augroup("Fugi", {})
		local autocmd = vim.api.nvim_create_autocmd
		autocmd = Fugitive,
    pattern = "*"
	end,
}

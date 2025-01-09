vim.g.mapleader = " "

local function map(mode, lhs, rhs, opt)
	opts = opts or {}
	opts.silent = true
	vim.keymap.set(mode, lhs, rhs, opt)
end

-- Exit to file list
map("n", "<leader>pv", vim.cmd.Ex)

-- Escape insert mode
map("i", "jk", "<ESC>")

-- mappings of basic commands
map("n", "<leader>w", "<CMD>w<CR>")
map("n", "<leader>q", "<CMD>q<CR>")

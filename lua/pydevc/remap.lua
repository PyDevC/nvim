local global = vim.g

global.mapleader = " "

local function map(mode, lhs, rhs, opt)
	opts = opts or {}
	opts.silent = true
	vim.keymap.set(mode, lhs, rhs, opt)
end

-- Exit to file list
map("n", "<leader>pv", vim.cmd.Ex)

map("i", "jk", "<ESC>")

-- Basic commands
map("n", "<leader>w", "<CMD>w<CR>")
map("n", "<leader>q", "<CMD>q<CR>")

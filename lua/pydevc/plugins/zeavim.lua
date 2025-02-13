return{
  'KabbAmine/zeavim.vim',
  config = function()
    vim.keymap.set("n", "gz", "<cmd>Zeavim<CR>")
    vim.keymap.set({"n", "v"}, "<leader>h", "<cmd>ZeavimV<CR>")
    vim.keymap.set("n", "<leader>H", "<cmd>ZVKeyDocset<CR>")
  end
}

vim.opt.completeopt = { "menu", "menuone", "noselect", "noselect" }
vim.opt.shortmess:append "c"

local lspkind = require "lspkind"
lspkind.init {}

local cmp = require "cmp"

local lsp_enabled = true

local sources = function()
  local srcs = {
    { name = "path" },
    { name = "buffer" },
  }
  if lsp_enabled then
    table.insert(srcs, 1, { name = "nvim_lsp" })
  end
  return srcs
end

cmp.setup {
  sources = sources(),
  mapping = {
    ["<C-n>"] = cmp.mapping.select_next_item { behavior = cmp.SelectBehavior.Insert },
    ["<C-p>"] = cmp.mapping.select_prev_item { behavior = cmp.SelectBehavior.Insert },
    ["<C-y>"] = cmp.mapping(
      cmp.mapping.confirm {
        behavior = cmp.ConfirmBehavior.Insert,
        select = true,
      },
      { "i", "c" }
    ),
  },
}

-- Setup up vim-dadbod
cmp.setup.filetype({ "sql" }, {
  sources = {
    { name = "vim-dadbod-completion" },
    { name = "buffer" },
  },
})

vim.keymap.set("n", "<leader>no", function()
  lsp_enabled = not lsp_enabled
  cmp.setup { sources = sources() }
  vim.notify("LSP autocomplete " .. (lsp_enabled and "enabled" or "disabled"))
end, { desc = "Toggle LSP autocomplete", silent = true })

local ls = require "luasnip"
ls.config.set_config {
  history = false,
  updateevents = "TextChanged,TextChangedI",
}

vim.keymap.set({ "i", "s" }, "<c-k>", function()
  if ls.expand_or_jumpable() then
    ls.expand_or_jump()
  end
end, { silent = true })

vim.keymap.set({ "i", "s" }, "<c-j>", function()
  if ls.jumpable(-1) then
    ls.jump(-1)
  end
end, { silent = true })

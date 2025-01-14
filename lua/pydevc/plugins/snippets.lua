return {
	"L3MON4D3/LuaSnip",
	version = "v2.*",
	build = "make install_jsregexp",
  dependencies = { 
    "rafamadiriz/friendly-snippets"
  }

	config = function() 
    local ls = require("luasnip")
    vim.keymap.set("i", "<C-s>e", function() ls.jump(1) end, {silent = true})
  end,
}

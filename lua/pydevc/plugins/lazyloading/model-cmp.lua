return {
  dir = "~/work/project/model-cmp.nvim",
  lazy = true,
  cmd = { "ModelCmp" },
  config = function()
    require("model_cmp").setup({
      requests = {
        delay_ms = 1000,
        max_retries = 5,
        timeout_ms = 300000,
      },
      api = {
        apikeys = {
          GEMINI_API_KEY = "<your-key>",
        },
        custom_url = {
          url = "http://127.0.0.1",
          port = "8080",
        },
      },

      virtualtext = {
        enable = false,
        type = "inline",

        style = { -- This is just a highlight group
          fg = "#b53a3a",
          italic = false,
          bold = false,
        },
      },
    })
    vim.keymap.set("i", "<C-s>", "<cmd>ModelCmp capture first<CR>")
  end,
}

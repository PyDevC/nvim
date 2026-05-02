return {
  "MeanderingProgrammer/render-markdown.nvim",
  opts = {
    heading = {
      enabled = false,
    },
    paragraph = {
      enabled = false,
    },
    code = {
      sign = false,
      width = "block",
      right_pad = 1,
      conceal_delimiters = false,
      language_icon = true,
    },
    checkbox = {
      enabled = true,
    },
    links = {
      enabled = false
    },
  },
  ft = { "markdown", "norg", "rmd", "org", "codecompanion" },
  config = function(_, opts)
    require("render-markdown").setup(opts)
  end,
}

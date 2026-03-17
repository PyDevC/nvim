return {
  {
    "neovim/nvim-lspconfig",
    event = 'VimEnter',
    dependencies = {
      { "j-hui/fidget.nvim", opts = {} },
      "b0o/SchemaStore.nvim",
    },
    config = function()
      vim.diagnostic.config({
        virtual_text = true,
        signs = true,
        update_in_insert = false,
        underline = true,
        severity_sort = false,
        float = true,
      })

      vim.api.nvim_create_autocmd("LspAttach", {
        callback = function(e)
          local opts = { buffer = e.buf }
          vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, opts)
          vim.keymap.set("n", "K", function() vim.lsp.buf.hover() end, opts)
          vim.keymap.set("n", "<leader>vws", function() vim.lsp.buf.workspace_symbol() end, opts)
          vim.keymap.set("n", "<leader>dt", function() vim.diagnostic.open_float() end, opts) -- extremly useful in diagnostics
          vim.keymap.set("n", "<leader>ca", function() vim.lsp.buf.code_action() end, opts)
          vim.keymap.set("n", "gr", function() vim.lsp.buf.references() end, opts)
          vim.keymap.set("n", "<leader>vrn", function() vim.lsp.buf.rename() end, opts)
          vim.keymap.set("i", "<C-h>", function() vim.lsp.buf.signature_help() end, opts)
          vim.keymap.set({ "n", "x" }, "<leader>f", vim.lsp.buf.format, { buffer = 0 })
        end
      })
    end,
  },
}

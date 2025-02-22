return {
  "neovim/nvim-lspconfig",
  config = function()
    local lspconfig = require('lspconfig')

    lspconfig.bashls.setup{
      bashIde = {
        enableSourceErrorDiagnostics = true,
        includeAllWorkspaceSymbols = true,
      }
    }

    lspconfig.clangd.setup{
    }

  end,
}

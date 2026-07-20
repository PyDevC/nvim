vim.filetype.add({
  extension = {
    mlir = "mlir",
  },
})

return {
  "neovim/nvim-lspconfig",
  dependencies = {
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",
  },
  config = function()
    local default_servers = {
      "lua_ls",
      "pyright",
      "clangd",
    }

    local mlir_get_executable = function()
      local homedir = os.getenv("HOME")
      local custom_path = homedir .. "/personal/github/llvm-project/build/bin/mlir-lsp-server"

      local cmd = { "mlir-lsp-server" }
      if vim.fn.executable(custom_path) == 1 then
        cmd = { custom_path }
      elseif vim.fn.executable("mlir-lsp-server") == 0 then
        return
      end
      return cmd
    end

    vim.lsp.config('mlir', {
      cmd = mlir_get_executable(),
      filetypes = { "mlir" },
      root_markers = { '.git', 'compile_commands.json', 'build' }
    })

    vim.lsp.enable('mlir')
    vim.diagnostic.config({
      virtual_text = true,
      signs = true,
      update_in_insert = false,
      underline = true,
      severity_sort = false,
      float = true,
    })

    -- Install default servers on first boot
    require("mason-lspconfig").setup({
      ensure_installed = default_servers
    })

    vim.lsp.enable(default_servers)

    vim.api.nvim_create_autocmd("LspAttach", {
      callback = function(args)
        local client = vim.lsp.get_client_by_id(args.data.client_id)
        if client and client:supports_method('textDocument/completion') then
          vim.lsp.completion.enable(true, client.id, args.buf, { autotrigger = true })
        end

        vim.keymap.set("n", "gd", vim.lsp.buf.definition, { desc = "Lsp: Jump to Definition" })
        vim.keymap.set("n", "K", vim.lsp.buf.hover, { desc = "Lsp: Function docstring and signature" })
        vim.keymap.set("n", "<leader>s", vim.lsp.buf.workspace_symbol, { desc = "Lsp: Symbol Search" })
        vim.keymap.set("n", "dt", vim.diagnostic.open_float, { desc = "Vim: Diagnostics" })
        vim.keymap.set("n", "gr", vim.lsp.buf.references, { desc = "Lsp: Jump to References" })
        vim.keymap.set("n", "<leader>vrn", vim.lsp.buf.rename, { desc = "Lsp: Rename a Symbol" })
        vim.keymap.set("n", "<leader>f", function() vim.lsp.buf.format({ aysnc = true }) end, { buffer = 0 })
        vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, { buffer = 0 })
      end,
    })
  end
}

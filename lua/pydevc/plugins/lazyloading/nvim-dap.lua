return {
  "mfussenegger/nvim-dap",
  event = "VeryLazy",
  dependencies = {
    "rcarriga/nvim-dap-ui",
    "nvim-neotest/nvim-nio",
    "jay-babu/mason-nvim-dap.nvim",
    "theHamsta/nvim-dap-virtual-text",
  },

  config = function()
    local mason_dap = require("mason-nvim-dap")
    local dap = require("dap")
    local ui = require("dapui")
    local dap_virtual_text = require("nvim-dap-virtual-text")

    -- Dap Virtual Text Setup
    dap_virtual_text.setup({})

    -- Mason DAP Setup
    mason_dap.setup({
      ensure_installed = { "codelldb" }, 
      automatic_installation = true,
      handlers = {
        function(config)
          require("mason-nvim-dap").default_setup(config)
        end,
      },
    })

    -- C and C++ Native LLDB Configurations
    local lldb_config = {
      {
        name = "Launch file (LLDB)",
        type = "codelldb",
        request = "launch",
        program = function()
          return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
        end,
        cwd = "${workspaceFolder}",
        stopOnEntry = false,
        disableASLR = false, 
      },
      {
        name = "Attach to running process",
        type = "codelldb",
        request = "attach",
        pid = function()
          return require('dap.utils').pick_process()
        end,
        cwd = "${workspaceFolder}",
      },
    }

    dap.configurations.c = lldb_config
    dap.configurations.cpp = lldb_config

    ui.setup()

    vim.fn.sign_define("DapBreakpoint", { text = "🐞", texthl = "DiagnosticError", linehl = "", numhl = "" })
    vim.fn.sign_define("DapBreakpointCondition", { text = "❓", texthl = "DiagnosticWarn", linehl = "", numhl = "" })
    vim.fn.sign_define("DapStopped", { text = "➔", texthl = "DiagnosticInfo", linehl = "Visual", numhl = "" })

    dap.listeners.before.attach.dapui_config = function() ui.open() end
    dap.listeners.before.launch.dapui_config = function() ui.open() end
    dap.listeners.before.event_terminated.dapui_config = function() ui.close() end
    dap.listeners.before.event_exited.dapui_config = function() ui.close() end

    vim.keymap.set("n", "<F5>", dap.continue, { desc = "Debug: Start/Continue Execution" })
    vim.keymap.set("n", "<F6>", dap.step_over, { desc = "Debug: Step Over (Next Line)" })
    vim.keymap.set("n", "<F7>", dap.step_into, { desc = "Debug: Step Into Function" })
    vim.keymap.set("n", "<F8>", dap.step_out, { desc = "Debug: Step Out of Function" })

    vim.keymap.set("n", "<leader>db", dap.toggle_breakpoint, { desc = "Debug: Toggle Normal Breakpoint" })
    vim.keymap.set("n", "<leader>dB", function()
      dap.set_breakpoint(vim.fn.input("Breakpoint Condition: "))
    end, { desc = "Debug: Set Conditional Breakpoint" })

    vim.keymap.set("n", "<leader>dc", dap.run_to_cursor, { desc = "Debug: Run execution straight to cursor" })
    vim.keymap.set("n", "<leader>de", ui.eval, { desc = "Debug: Evaluate Expression under cursor" })
    vim.keymap.set("n", "<leader>dr", dap.repl.open, { desc = "Debug: Open Interactive REPL Prompt" })
    vim.keymap.set("n", "<leader>dt", dap.terminate, { desc = "Debug: Stop/Terminate Session Completely" })
    vim.keymap.set("n", "<leader>du", ui.toggle, { desc = "Debug: Manually Toggle Window Layouts" })
  end,
}

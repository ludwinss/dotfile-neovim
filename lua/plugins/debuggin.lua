return {
  "mfussenegger/nvim-dap",
  dependencies = {
    "rcarriga/nvim-dap-ui",       -- Interfaz gráfica para ver variables y breakpoints
    "jay-babu/mason-nvim-dap.nvim", -- Integración con Mason.nvim
  },
  config = function()
    local dap = require("dap")
    local dapui = require("dapui")

    -- 📌 Configurar DAP UI
    dapui.setup()

    -- 📌 Configurar adaptador de depuración para Node.js y TypeScript
    dap.adapters["pwa-node"] = {
      type = "server",
      host = "128.0.0.1",
      port = 9230,
      executable = {
        command = "node",
        args = { os.getenv("HOME") .. "/.local/share/nvim/vscode-js-debug/out/src/dapDebugServer.js" },
      },
    }

    -- 📌 Configuración para depurar TypeScript y JavaScript
    dap.configurations.typescript = {
      {
        type = "pwa-node",
        request = "launch",
        name = "Launch File",
        program = "${file}",
        cwd = vim.fn.getcwd(),
        sourceMaps = true,
        skipFiles = { "<node_internals>/**" },
        protocol = "inspector",
        console = "integratedTerminal",
      },
      {
        type = "pwa-node",
        request = "attach",
        name = "Attach to Process",
        processId = function()
          local output = vim.fn.system("pgrep -n node")
          return tonumber(output) or nil
        end,
        cwd = vim.fn.getcwd(),
        sourceMaps = true,
        skipFiles = { "<node_internals>/**" },
        protocol = "inspector",
        console = "integratedTerminal",
      },
    }

    dap.configurations.javascript = dap.configurations.typescript

    -- 📌 Auto abrir y cerrar DAP UI
    dap.listeners.before.attach.dapui_config = function()
      dapui.open()
    end
    dap.listeners.before.launch.dapui_config = function()
      dapui.open()
    end
    dap.listeners.before.event_terminated.dapui_config = function()
      dapui.close()
    end
    dap.listeners.before.event_exited.dapui_config = function()
      dapui.close()
    end

    -- 📌 Atajos de teclado
    vim.keymap.set("n", "<Leader>dt", ":DapToggleBreakpoint<CR>", { desc = "Toggle Breakpoint" })
    vim.keymap.set("n", "<Leader>dc", ":DapContinue<CR>", { desc = "Continue" })
    vim.keymap.set("n", "<Leader>dx", ":DapTerminate<CR>", { desc = "Terminate" })
    vim.keymap.set("n", "<Leader>do", ":DapStepOver<CR>", { desc = "Step Over" })
  end,
}


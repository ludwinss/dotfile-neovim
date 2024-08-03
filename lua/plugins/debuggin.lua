return {
  "mfussenegger/nvim-dap",
  dependencies = {
    "leoluz/nvim-dap-go",
    "rcarriga/nvim-dap-ui",
  },
  config = function()
    require("dapui").setup()
    require("dap-go").setup()


  local dap, dapui = require("dap"), require("dapui")

   dap.adapters.node2 = {
     type = "executable",
     command = "node",
     args = {
       require("mason-registry").get_package("node-debug2-adapter"):get_install_path() .. "/out/src/nodeDebug.js",
     }
   }

   dap.configurations.typescript = {
     {
       type = "node2",
       request = "attach",
       program = "${file}",
       cwd = "${workspaceFolder}",
       sourceMaps = true,
       protocol = "inspector",
       port = 9229,
     }
   }

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

   vim.keymap.set("n", "<Leader>dt", ":DapToggleBreakpoint<CR>")
    vim.keymap.set("n", "<Leader>dc", ":DapContinue<CR>")
    vim.keymap.set("n", "<Leader>dx", ":DapTerminate<CR>")
    vim.keymap.set("n", "<Leader>do", ":DapStepOver<CR>")
  end,
}

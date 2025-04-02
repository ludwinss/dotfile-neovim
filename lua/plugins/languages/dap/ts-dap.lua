local dap = require("dap")

local mason_path = vim.fn.stdpath("data")
local debugger_path = mason_path .. "/mason/packages/node-debug2-adapter/out/src/nodeDebug.js"

dap.adapters.node2 = {
  type = "executable",
  command = "node",
  args = { debugger_path },
}

dap.configurations.typescript = {
  {
    name = "NestJS Debug",
    type = "node2",
    request = "launch",
    program = "${workspaceFolder}/src/main.ts",
    cwd = vim.fn.getcwd(),
    runtimeArgs = { "-r", "ts-node/register" },
    sourceMaps = true,
    protocol = "inspector",
    console = "integratedTerminal",
    skipFiles = { "<node_internals>/**", "node_modules/**" },
  },
}

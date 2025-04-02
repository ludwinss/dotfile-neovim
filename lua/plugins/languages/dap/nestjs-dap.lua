local dap = require("dap")

dap.adapters.node2 = {
  type = "executable",
  command = "node",
  args = {
    vim.fn.stdpath("data") .. "/mason/packages/node-debug2-adapter/out/src/nodeDebug.js"
  }
}

dap.configurations.typescript = {
  {
    name = "Attach to NestJS",
    type = "node2",
    request = "attach",
    port = 9229,
    protocol = "inspector",
    cwd = vim.fn.getcwd(),
    restart = true,
    sourceMaps = true,
    skipFiles = { "<node_internals>/**", "**/node_modules/**" },
  },
}

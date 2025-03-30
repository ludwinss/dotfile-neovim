require("mason-tool-installer").setup({
  ensure_installed = {
    "csharpier",
    "stylua",
    "prettier",
  },
  auto_update = true,
  run_on_start = true,
})

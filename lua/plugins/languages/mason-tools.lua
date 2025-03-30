require("mason-tool-installer").setup({
  ensure_installed = {
    "csharpier",
    "stylua"
  },
  auto_update = true,
  run_on_start = true,
})

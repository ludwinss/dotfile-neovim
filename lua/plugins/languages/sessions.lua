require("auto-session").setup({

  auto_session_suppress_dirs = { "~/", "~/Downloads", "/" },
  auto_session_use_git_branch = false,

  auto_session_enable_last_session = false,

  session_lens = {
    buftypes_to_ignore = {},
    load_on_setup = true,
    theme_conf = { border = true },
    previewer = false,
  },
})

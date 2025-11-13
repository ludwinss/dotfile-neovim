local M = {}

function M.setup()
	require("config.options").setup()
	require("config.keymaps").setup()
end

return M

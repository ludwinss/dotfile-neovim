local M = require("utils.lua")

M = M.merge(M, require("utils.nvim"))
M = M.merge(M, require("utils.git"))
M = M.merge(M, require("utils.ui"))

return M

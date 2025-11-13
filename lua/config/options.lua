local M = {}

function M.setup()
	vim.g.mapleader = " "

	local opt = vim.opt
	opt.termguicolors = true
	opt.number = true
	opt.relativenumber = true
	opt.signcolumn = "yes"
	opt.wrap = false
	opt.cursorline = true
	opt.expandtab = true
	opt.shiftwidth = 2
	opt.tabstop = 2
	opt.smartindent = true
	opt.splitbelow = true
	opt.splitright = true
	opt.ignorecase = true
	opt.smartcase = true
	opt.scrolloff = 5
	opt.sidescrolloff = 5
	opt.updatetime = 300
	opt.timeoutlen = 400
	opt.clipboard = "unnamedplus"
end

return M

-- line number
vim.opt.number = true
vim.opt.relativenumber = true

-- tabs
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

--
vim.opt.clipboard = "unnamedplus"
vim.opt.cursorline = true
vim.opt.scrolloff = 5

-- inline diagnostics
vim.diagnostic.config({
	virtual_text = true,
	signs = true,
	underline = true,
	update_in_insert = true,
})

-- dap signs
local aquamarine = "#7FFFD4"
vim.api.nvim_set_hl(0, "DapBreakpoint", { fg = aquamarine })
vim.api.nvim_set_hl(0, "DapStopped", { fg = aquamarine })

vim.fn.sign_define("DapBreakpoint", {
	text = "●",
	texthl = "DapBreakpoint",
	linehl = "",
	numhl = "",
})
vim.fn.sign_define("DapStopped", {
	text = "▶",
	texthl = "DapStopped",
	linehl = "Visual",
	numhl = "",
})

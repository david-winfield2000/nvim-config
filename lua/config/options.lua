-- line number
vim.opt.number = true
vim.opt.relativenumber = true
vim.api.nvim_set_hl(0, "LineNr", {
	fg = "#999999",
})
vim.api.nvim_set_hl(0, "CursorLineNr", {
	fg = "#00D1B2",
	bold = true,
})

-- tabs
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

-- misc
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

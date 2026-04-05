return {
	"stevearc/oil.nvim",
	---@module 'oil'
	---@type oil.SetupOpts
	opts = {},
	dependencies = { "nvim-tree/nvim-web-devicons" },
	lazy = false,
	keys = {
		{
			"<leader>e",
			function()
				local oil = require("oil")

				-- if already in oil, close it
				if vim.bo.filetype == "oil" then
					vim.cmd("bd")
					return
				end

				-- open left vertical split
				vim.cmd("topleft vsplit")
				vim.cmd("vertical resize 30")

				oil.open()
			end,
			desc = "Toggle Oil",
		},
	},
}

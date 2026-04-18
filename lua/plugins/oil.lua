return {
	"stevearc/oil.nvim",
	---@module 'oil'
	---@type oil.SetupOpts
	dependencies = { "nvim-tree/nvim-web-devicons" },
	lazy = false,
	keys = {
		{ "-", "<CMD>Oil<CR>", desc = "Open parent directory" },
	},
	opts = {
		view_options = {
			is_hidden_file = function(name, bufnr)
				if name == ".." or name == ".git" then
					return true
				end
				local full = require("oil").get_current_dir(bufnr) .. name
				return vim.fn.system("git check-ignore " .. full) ~= ""
			end,
		},
	},
	config = function(_, opts)
		require("oil").setup(opts)
	end,
}

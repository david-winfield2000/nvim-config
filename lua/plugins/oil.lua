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
				return name == ".." or name == ".git"
			end,
		},
	},
	config = function(_, opts)
		require("oil").setup(opts)
	end,
}

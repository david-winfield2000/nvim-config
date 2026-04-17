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
		lsp_file_methods = {
			enabled = true,
			timeout_ms = 1000,
			autosave_changes = true,
		},
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

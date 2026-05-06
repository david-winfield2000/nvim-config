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
				-- normal files
				if name == ".." or name == ".git" then
					return true
				end

				-- mac files
				if name == ".DS_Store" then
					return true
				end

				-- python files
				if name == "venv" or name == "__pycache__" or name:match("%.pyc") then
					return true
				end
			end,
		},
		lsp_file_methods = {
			enabled = true,
			timeout_ms = 1000,
			autosave_changes = true,
		},
	},
	config = function(_, opts)
		require("oil").setup(opts)
	end,
}

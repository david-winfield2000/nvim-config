return {
	"stevearc/conform.nvim",
	opts = {
		formatters_by_ft = {
			lua = { "stylua" },
			python = { "black", "isort" },
			markdown = { "prettier" },
		},
		format_on_save = {
			timeout_ms = 1000,
			lsp_fallback = true,
		},
	},
	config = function(_, opts)
		require("conform").setup(opts)
	end,
}

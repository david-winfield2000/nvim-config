return {
	"mason-org/mason-lspconfig.nvim",
	dependencies = {
		"mason-org/mason.nvim",
		"neovim/nvim-lspconfig",
	},
	opts = {
		ensure_installed = {
			"lua_ls",
			"stylua",
			"pyright",
			"bashls",
			"gopls",
		},
	},
	config = function(_, opts)
		require("mason-lspconfig").setup(opts)
	end,
}

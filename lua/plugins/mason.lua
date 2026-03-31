return {
	"mason-org/mason-lspconfig.nvim",
	dependencies = {
		{
			"mason-org/mason.nvim",
			opts = {
				ui = {
					icons = {
						package_installed = "✓",
						package_pending = "➜",
						package_uninstalled = "✗",
					},
				},
			},
			keys = {
				{
					"<leader>m",
					":Mason<CR>",
					desc = "Mason",
				},
			},
		},
		"neovim/nvim-lspconfig",
	},
	config = function()
		require("mason-lspconfig").setup()
	end,
}

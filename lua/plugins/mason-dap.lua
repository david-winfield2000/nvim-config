return {
	"jay-babu/mason-nvim-dap.nvim",
	lazy = true,
	dependencies = {
		"mason-org/mason.nvim",
		"mfussenegger/nvim-dap",
	},
	opts = {
		ensure_installed = { "debugpy" },
		automatic_installation = true,
		handlers = {
			function(config)
				require("mason-nvim-dap").default_setup(config)
			end,
		},
	},
	config = function(_, opts)
		require("mason-nvim-dap").setup(opts)
	end,
}

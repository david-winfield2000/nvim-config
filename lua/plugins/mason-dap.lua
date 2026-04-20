return {
	"williamboman/mason.nvim",
	"mfussenegger/nvim-dap",
	"jay-babu/mason-nvim-dap.nvim",
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

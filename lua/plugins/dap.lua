return {
	"mfussenegger/nvim-dap",
	config = function()
		local dap = require("dap")

		-- Configurations
		dap.configurations.python = {
			{
				name = "Launch file",
				type = "python",
				request = "launch",
				program = "${file}",
				cwd = vim.fn.getcwd(),
				console = "integratedTerminal",
			},
		}
	end,
	keys = {
		{
			"<leader>db",
			function()
				require("dap").toggle_breakpoint()
			end,
			desc = "Toggle Breakpoint",
			nowait = true,
			remap = false,
		},
		{
			"<leader>dc",
			function()
				require("dap").continue()
			end,
			desc = "Continue",
			nowait = true,
			remap = false,
		},
		{
			"<leader>di",
			function()
				require("dap").step_into()
			end,
			desc = "Step Into",
			nowait = true,
			remap = false,
		},
		{
			"<leader>do",
			function()
				require("dap").step_over()
			end,
			desc = "Step Over",
			nowait = true,
			remap = false,
		},
		{
			"<leader>du",
			function()
				require("dap").step_out()
			end,
			desc = "Step Out",
			remap = false,
		},
	},
}

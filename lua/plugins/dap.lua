return {
	"mfussenegger/nvim-dap",
	event = "VeryLazy",
	dependencies = {
		"rcarriga/nvim-dap-ui",
		"nvim-neotest/nvim-nio",
	},
	config = function()
		local dap = require("dap")
		local ui = require("dapui")

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

		-- Dap UI
		ui.setup()
		dap.listeners.before.attach.dapui_config = function()
			ui.open()
		end
		dap.listeners.before.launch.dapui_config = function()
			ui.open()
		end
		dap.listeners.before.event_terminated.dapui_config = function()
			ui.close()
		end
		dap.listeners.before.event_exited.dapui_config = function()
			ui.close()
		end
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
		{
			"<leader>dt",
			function()
				require("dapui").toggle()
			end,
			desc = "Toggle DAP UI",
		},
	},
}

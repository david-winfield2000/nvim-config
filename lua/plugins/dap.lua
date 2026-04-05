return {
	"mfussenegger/nvim-dap",
	config = function()
		local dap = require("dap")

		vim.api.nvim_set_hl(0, "DapBreakpointSign", { fg = "#f14c4c" })
		vim.fn.sign_define("DapBreakpoint", { text = "●", texthl = "DapBreakpointSign" })

		-- python dap setup
		dap.adapters.python = {
			type = "executable",
			command = "python",
			args = { "-m", "debugpy.adapter" },
		}

		-- look for any project lua dap config
		local project_configs = vim.fn.globpath(vim.fn.getcwd(), ".nvim/*.lua", false, true)
		for _, file in ipairs(project_configs) do
			dofile(file)
		end
	end,
	keys = {
		{
			"<leader>db",
			function()
				require("dap").toggle_breakpoint()
			end,
			desc = "Toggle Breakpoint",
		},
		{
			"<leader>F5",
			function()
				require("dap").continue()
			end,
			desc = "Continue",
		},
		{
			"<leader>F11",
			function()
				require("dap").step_into()
			end,
			desc = "Step Into",
		},
		{
			"<leader>F10",
			function()
				require("dap").step_over()
			end,
			desc = "Step Over",
		},
		{
			"<leader>F12",
			function()
				require("dap").step_out()
			end,
			desc = "Step Out",
		},
	},
}

return {
	"mfussenegger/nvim-dap",
	config = function()
		vim.api.nvim_set_hl(0, "DapBreakpointSign", { fg = "#f14c4c" })
		vim.fn.sign_define("DapBreakpoint", { text = "●", texthl = "DapBreakpointSign" })

		-- use dap for python
		dap.adapters.python = {
			type = "executable",
			command = "python",
			args = { "-m", "debugpy.adapter" },
		}
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

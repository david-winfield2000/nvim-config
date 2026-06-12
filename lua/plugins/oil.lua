local function parse_output(proc)
	local result = proc:wait()
	local ret = {}
	if result.code == 0 then
		for line in vim.gsplit(result.stdout, "\n", { plain = true, trimempty = true }) do
			line = line:gsub("/$", "")
			ret[line] = true
		end
	end
	return ret
end

local function new_git_status()
	return setmetatable({}, {
		__index = function(self, key)
			local ignore_proc = vim.system(
				{ "git", "ls-files", "--ignored", "--exclude-standard", "--others", "--directory" },
				{ cwd = key, text = true }
			)
			local tracked_proc = vim.system({ "git", "ls-tree", "HEAD", "--name-only" }, { cwd = key, text = true })

			local ret = {
				ignored = parse_output(ignore_proc),
				tracked = parse_output(tracked_proc),
			}

			rawset(self, key, ret)
			return ret
		end,
	})
end

local git_status = new_git_status()

return {
	"stevearc/oil.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	lazy = false,
	keys = {
		{ "-", "<CMD>Oil<CR>", desc = "Open parent directory" },
	},
	opts = {
		watch_for_changes = true,
		keymaps = {
			["<C-l>"] = false,
		},
		view_options = {
			is_hidden_file = function(name, bufnr)
				if name == ".." then
					return true
				end

				local dir = require("oil").get_current_dir(bufnr)
				local is_dotfile = vim.startswith(name, ".") and name ~= ".."

				if not dir then
					return is_dotfile
				end

				if is_dotfile then
					return not git_status[dir].tracked[name]
				else
					return git_status[dir].ignored[name]
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

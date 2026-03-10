local builtin = require("telescope.builtin")

-- telescope keymaps
vim.keymap.set("n", "<leader>ff", builtin.find_files, {desc="Find Files"})
vim.keymap.set("n", "<leader>fg", builtin.live_grep, {desc="Grep in Files"})

-- neo tree keymaps
vim.keymap.set("n","<leader>e",":Neotree filesystem toggle left<CR>")


-- lazy keymaps
vim.keymap.set("n", "<leader>l", ":Lazy<CR>", { noremap = true, silent = true })

-- telescope keymaps
local telescope = require("telescope.builtin")
vim.keymap.set("n", "<leader>ff", telescope.find_files, { desc = "Find Files" })
vim.keymap.set("n", "<leader>fg", telescope.live_grep, { desc = "Grep in Files" })

-- mason keymaps
vim.keymap.set("n", "<leader>m", ":Mason<CR>", { noremap = true, silent = true })

-- neo tree keymaps
vim.keymap.set("n", "<leader>e", ":Neotree filesystem toggle left<CR>")

-- oil keymaps
vim.keymap.set("n", "-", "<CMD>Oil<CR>", { desc = "Open parent directory" })

-- misc keymaps
vim.keymap.set("n", "gD", "<cmd>lua vim.lsp.buf.definition()<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")

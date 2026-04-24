-- lazy keymaps
vim.keymap.set("n", "<leader>l", ":Lazy<CR>", { noremap = true, silent = true })

-- misc keymaps
vim.keymap.set("n", "gD", "<cmd>lua vim.lsp.buf.definition()<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, { desc = "LSP rename" })
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "G", "Gzz")

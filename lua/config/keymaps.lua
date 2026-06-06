-- lazy
vim.keymap.set("n", "<leader>l", ":Lazy<CR>", { noremap = true, silent = true })

-- quickfix
vim.keymap.set("n", "<leader>q", ":copen<CR>", { noremap = true, silent = true })

-- misc
vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, { desc = "LSP rename" })
vim.keymap.set("n", "gD", vim.lsp.buf.definition, {
	desc = "Go to Definition",
})

-- recenter when making large jumps
vim.keymap.set("n", "<C-d>", "<C-d>zz", { noremap = true, silent = true })
vim.keymap.set("n", "<C-u>", "<C-u>zz", { noremap = true, silent = true })
vim.keymap.set("n", "G", "Gzz", { noremap = true, silent = true })

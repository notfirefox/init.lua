vim.keymap.set({ "n", "v" }, "<up>", "<nop>")
vim.keymap.set({ "n", "v" }, "<down>", "<nop>")
vim.keymap.set({ "n", "v" }, "<left>", "<nop>")
vim.keymap.set({ "n", "v" }, "<right>", "<nop>")
vim.keymap.set({ "v" }, "J", ":m '>+1<CR>gv=gv")
vim.keymap.set({ "v" }, "K", ":m '<-2<CR>gv=gv")

vim.g.mapleader = " "

vim.keymap.set("n", "<C-n>", ":Neotree filesystem reveal left toggle<CR>")
vim.keymap.set("n", "<leader>e", ":Neotree focus<CR>")

vim.keymap.set("n", "<leader>ff", ":Telescope find_files<CR>", {})
vim.keymap.set("n", "<leader>fw", ":Telescope live_grep<CR>", {})
vim.keymap.set("n", "<leader>fh", ":Telescope help_tags<CR>", {})
vim.keymap.set("n", "<leader>th", ":Telescope colorscheme<CR>", {})
vim.keymap.set("n", "<leader>of", ":Telescope oldfiles<CR>", {})
vim.keymap.set("n", "<leader>km", ":Telescope keymaps<CR>", {})
vim.keymap.set("n", "<leader>lp", ":Telescope lsp_document_symbols<CR>")
vim.keymap.set("n", "<leader>lr", ":Telescope lsp_references<CR>")
vim.keymap.set("n", "<leader>ld", ":Telescope lsp_definitions<CR>")

vim.keymap.set("n", "<leader>ft", vim.lsp.buf.format, {})

vim.keymap.set("n", "<tab>", ":BufferNext<CR>")
vim.keymap.set("n", "<S-tab>", ":BufferPrevious<CR>")
vim.keymap.set("n", "<leader>x", ":BufferClose<CR>")

vim.keymap.set("n", "<leader>tr", ":ToggleTerm<CR>")

vim.keymap.set("n", "<leader>/", "gcc", { remap = true })

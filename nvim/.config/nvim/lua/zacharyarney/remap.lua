vim.g.mapleader = " "
local map, opts = vim.keymap.set, {noremap = true, silent = true}

-- netrw like vscode
map("n", "<leader>ke", vim.cmd.Ex, opts)

-- Buffer nav
map("n", "<leader>l", function() vim.cmd.bnext{count = vim.v.count1} end, opts)
map("n", "<leader>h", function() vim.cmd.bprev{count = vim.v.count1} end, opts)

-- Keep cursor centered when scrolling
map("n", "<C-d>", "<C-d>zz", opts)
map("n", "<C-u>", "<C-u>zz", opts)

-- Brace pairs
map('i', '(<CR>', '(<CR>)<Esc>O', opts)
map('i', '[<CR>', '[<CR>]<Esc>O', opts)
map('i', '{<CR>', '{<CR>}<Esc>O', opts)


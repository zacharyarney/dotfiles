local za_cursorline = vim.api.nvim_create_augroup('za_cursorline', { clear = true })

vim.api.nvim_create_autocmd('InsertEnter', {
    callback = function()
        vim.opt.cursorline = true
    end,
    group = za_cursorline
})

vim.api.nvim_create_autocmd('InsertLeave', {
    callback = function()
        vim.opt.cursorline = false
    end,
    group = za_cursorline
})

--
-- FORMATTING
--
local za_format = vim.api.nvim_create_augroup("za_format", { clear = true })
local map, opts = vim.keymap.set, {noremap = true, silent = true}

-- clang-format
vim.api.nvim_create_autocmd("FileType", {
    pattern = { 'c', 'cpp' },
    callback = function()
        map('n', '<leader>cf', ':%!clang-format<CR>', opts)
    end,
    group = za_format,
})

-- black format (python)
vim.api.nvim_create_autocmd("FileType", {
    pattern = { 'python' },
    callback = function()
        map('n', '<leader>cf', ':silent !black %<CR>', opts)
    end,
    group = za_format,
})

vim.api.nvim_create_autocmd("bufWritePost", {
    pattern = "*.py",
    command = "silent !black %",
    group = za_format,
})

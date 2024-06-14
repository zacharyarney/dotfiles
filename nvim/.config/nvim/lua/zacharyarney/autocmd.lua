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


-- Statusline
local za_Stl = vim.api.nvim_create_augroup('za_Stl', { clear = true })

vim.api.nvim_create_autocmd({ 'WinEnter', 'BufEnter' }, {
    callback = function()
    end,
    group = za_Stl
})

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

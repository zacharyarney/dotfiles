local au_conf = vim.api.nvim_create_augroup('Conf', { clear = true })

vim.api.nvim_create_autocmd('InsertEnter', {
    callback = function()
        vim.opt.cursorline = true
    end,
    group = au_conf
})

vim.api.nvim_create_autocmd('InsertLeave', {
    callback = function()
        vim.opt.cursorline = false
    end,
    group = au_conf
})

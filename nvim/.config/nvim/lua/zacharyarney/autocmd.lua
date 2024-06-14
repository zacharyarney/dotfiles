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
        function _G.MyStatusLine()
            local rest = " %m %r %w%=%y %l:%c "
            if vim.fn.expand('%:~:.') == '' or vim.bo.buftype ~= '' then
                return '%t' .. rest
            end
                return vim.fn.expand('%:~:.') .. rest
        end

        vim.opt.statusline = '%!v:lua.MyStatusLine()'
    end,
    group = za_Stl
})

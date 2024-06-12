vim.api.nvim_create_user_command(
    'Scratch',
    function ()
        vim.api.nvim_command('enew')
        vim.opt.swapfile = false
        vim.opt.buftype = 'nofile'
        vim.opt.bufhidden = 'hide'
    end,
    {}
)


vim.api.nvim_create_user_command(
    'WordProcessorMode',
    function ()
        vim.keymap.set('', 'j', 'gj')
        vim.keymap.set('', 'l', 'gl')

        vim.opt.formatoptions = '1'
        vim.opt.expandtab = false
        vim.opt.wrap = true
        vim.opt.linebreak = true
        vim.opt.spell = true
        vim.opt.spelllang = 'en_us'
    end,
    {}
)

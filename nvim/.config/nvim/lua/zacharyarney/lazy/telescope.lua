return {
    'nvim-telescope/telescope.nvim',
    tag = '0.1.6',
    -- or                              , branch = '0.1.x',
    dependencies = { 'nvim-lua/plenary.nvim' },

    config = function()
        local opts = { noremap = true, silent = true }
        local builtin = require('telescope.builtin')
        vim.keymap.set('n', '<leader>ff', function()
            builtin.find_files({ find_command = { 'rg', '--files', '--hidden', '-g', '!.git' } })
        end, opts)
        vim.keymap.set('n', '<leader>gf', builtin.git_files, opts)
        vim.keymap.set('n', '<leader>fg', builtin.live_grep, opts)
        vim.keymap.set('n', '<leader>bb', builtin.buffers, opts)
        vim.keymap.set('n', '<leader>fs', function()
            builtin.grep_string({ search = vim.fn.input('Grep > ') })
        end)
        vim.keymap.set('n', '<leader>fh', builtin.help_tags, opts)
        require('telescope').setup {
            defaults = {
                'rg',
                '--color=never',
                '--no-heading',
                '--with-filename',
                '--line-number',
                '--column',
                '--smart-case',
                '-uu' -- don't respect .gitignore and show hidden files
            },
            pickers = {
                find_files = {
                    hidden = true,
                }
            },
        }
    end
}
